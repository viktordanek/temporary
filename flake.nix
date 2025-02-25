{
    inputs =
        {
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
        } ;
    outputs =
        { flake-utils , nixpkgs , self } :
            let
                fun =
                    system :
                        let
                            lib =
                                {
                                    at ? "/run/wrappers/bin/at" ,
                                    caller ,
                                    initializer ? 64 ,
                                    resource-mask ? "temporary.XXXXXXXX" ,
                                    standard-error ? 65 ,
                                    temporary ? { } ,
                                } :
                                    let
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    installPhase =
                                                        let
                                                            constructor =
                                                                let
                                                                    constructors =
                                                                        let
                                                                            mapper =
                                                                                path : name : value :
                                                                                    if builtins.typeOf value == "lambda" then [ "${ pkgs.coreutils }/bin/ln --symbolic ${ value null } ${ hash path name }" ]
                                                                                    else if builtins.typeOf value == "list" then
                                                                                        let
                                                                                            generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                                            in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                                    else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) ) value )
                                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for construction is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                                            in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) dependencies ) ) ;
                                                                    in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ [ "source ${ builtins.concatStringsSep "" [ "$" "{" "MAKE_WRAPPER" "}" ] }/nix-support/setup-hook" ] constructors ] ) ;
                                                            in
                                                               ''
                                                                   ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                        ${ pkgs.coreutils }/bin/cat ${ builtins.toFile "constructor.sh" constructor } > $out/constructor.sh &&
                                                                        ${ pkgs.coreutils }/bin/chmod 0500 $out/constructor.sh &&
                                                                        makeWrapper $out/constructor.sh $out/constructor --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set ECHO ${ pkgs.coreutils }/bin/echo --set MAKE_WRAPPER ${ pkgs.buildPackages.makeWrapper } --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set STORE $out &&
                                                                        ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                        $out/constructor
                                                                '' ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    name = "temporary-implementation" ;
                                                    src = ./. ;
                                                } ;
                                        dependencies =
                                            let
                                                filter =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then true
                                                        else if builtins.typeOf value == "list" then true
                                                        else if builtins.typeOf value == "null" then true
                                                        else if builtins.typeOf value == "set" then true
                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for filtering initialization is not lambda, list, null, nor set but ${ builtins.typeOf value }." ;
                                                lambda =
                                                    path : name : value : ignore :
                                                        let
                                                            defaults =
                                                                let
                                                                    identity =
                                                                        { init ? null , post ? null , release ? null , tests ? [ ] } :
                                                                            {
                                                                                init = init ;
                                                                                post = post ;
                                                                                release = release ;
                                                                                tests = tests ;
                                                                            } ;
                                                                    in identity ( value ignore ) ;
                                                            in temporary-derivation defaults.init defaults.release defaults.post ;
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then lambda path name value
                                                        else if builtins.typeOf value == "list" then
                                                            let
                                                                generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( pkgs.lib.filterAttrs ( filter ( builtins.concatLists [ path [ name ] ] ) index builtins.elemAt value index ) ) ;
                                                                in builtins.genList generator ( builtins.length value )
                                                        else if builtins.typeOf value == "null" then lambda path name ( x : { } )
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) ( pkgs.lib.filterAttrs ( filter ( builtins.concatLists [ path [ name ] ] ) value ) )
                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for mapping initialization is not lambda, list, null, nor set but ${ builtins.typeOf value }." ;
                                                temporary-derivation =
                                                    init : release : post :
                                                        pkgs.stdenv.mkDerivation
                                                            {
                                                                installPhase =
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                            ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/setup.sh" } $out/setup.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0550 $out/setup.sh &&
                                                                            makeWrapper \
                                                                                $out/setup.sh \
                                                                                $out/setup \
                                                                                --set CHMOD ${ pkgs.coreutils }/bin/chmod \
                                                                                --set ECHO ${ pkgs.coreutils }/bin/echo \
                                                                                ${ grandparent-pid { } } \
                                                                                --set INIT $out/init \
                                                                                ${ is-file { } } \
                                                                                ${ is-interactive { } } \
                                                                                ${ is-pipe { } } \
                                                                                --set LN ${ pkgs.coreutils }/bin/ln \
                                                                                --set MKTEMP ${ pkgs.coreutils }/bin/mktemp \
                                                                                ${ parent-pid { } } \
                                                                                --set POST $out/post /
                                                                                --set RELEASE $out/release \
                                                                                --set RESOURCE_MASK ${ resource-mask } \
                                                                                --set TEARDOWN_ASYNCH $out/teardown-asynch \
                                                                                --set TEARDOWN_SYNCH $out/teardown-synch \
                                                                                --set TEE ${ pkgs.coreutils }/bin/tee
                                                                    '' ;
                                                                name = "temporary" ;
                                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                                src = ./. ;
                                                            } ;
                                                in builtins.mapAttrs ( mapper [ ] ) ( pkgs.lib.filterAttrs ( filter [ ] ) ( if builtins.typeOf temporary == "set" then temporary else builtins.throw "The temporary must be a set but it is a ${ builtins.typeOf temporary }." ) ) ;
                                        grandparent-pid = { name ? "GRANDPARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                                        harvest =
                                            {
                                                derivation =
                                                    let
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then hash path name
                                                                else if builtins.typeOf value == "list" then
                                                                    let
                                                                        generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                        in builtins.genList generator ( builtins.length value )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) value
                                                                else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for harvest is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                        in builtins.mapAttrs ( mapper [ ] ) dependencies ;
                                            } ;
                                        hash = path : name : builtins.concatStringsSep "/" ( builtins.map builtins.toString [ derivation ( builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.fromJSON ( builtins.concatLists [ path [ name ] ] ) ) ) ) ] ) ;
                                        is-file = { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-interactive = { name ? "IS_INTERACTIVE" } : "--run 'export ${ name }=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-pipe = { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        parent-pid = { name ? "PARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                                        in harvest ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        pkgs.stdenv.mkDerivation
                                            {
                                                installPhase =
                                                    let
                                                        resources =
                                                            {
                                                                foobar =
                                                                    lib
                                                                        {
                                                                            caller = self ;
                                                                            initializer = 66 ;
                                                                            resource-mask = "temporary.foobar.XXXXXXXX" ;
                                                                            standard-error = 67 ;
                                                                            temporary =
                                                                                {
                                                                                    foobar = shell-script : { } ;
                                                                                } ;
                                                                        } ;
                                                            } ;
                                                        in
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources.foobar.derivation.foobar } &&
                                                                    exit 68
                                                            '' ;
                                                name = "temporary-checks" ;
                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                src = ./. ;
                                            } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}