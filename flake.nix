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
                                                            constructors =
                                                                let
                                                                    mapper =
                                                                        path : name : value :
                                                                            if builtins.typeOf value == "lambda" then [ "${ pkgs.coreutils }/bin/ln --symbolic ${ value null }/setup ${ resolve "$out" path name }" ]
                                                                            else if builtins.typeOf value == "list" then
                                                                                let
                                                                                    generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                                    in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                            else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) ) value )
                                                                            else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for construction is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                                    in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) dependencies ) ) ;
                                                            in
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                        ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/clean.sh" } > $out/clean.sh &&
                                                                        ${ pkgs.coreutils }/bin/chmod 0555 $out/clean &&
                                                                        makeWrapper $out/clean.sh $out/clean --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin --set RESOURCE_MASK ${ resource-mask } --set SED ${ pkgs.gnused }/bin/sed
                                                                        ${ builtins.concatStringsSep " &&\n\t" constructors }
                                                                '' ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    name = "temporary-implementation" ;
                                                    src = ./. ;
                                                } ;
                                        dependencies =
                                            let
                                                defaults =
                                                    value : ignore :
                                                        let
                                                            identity =
                                                                { init ? null , post ? null , release ? null , tests ? [ ] } :
                                                                    {
                                                                        init = init ;
                                                                        post = post ;
                                                                        release = release ;
                                                                        tests =
                                                                            let
                                                                                identity =
                                                                                    { paste ? null , pipe ? null , arguments ? null , file ? null , status ? true , expected , count ? 3 } :
                                                                                        {
                                                                                            paste = paste ;
                                                                                            pipe = pipe ;
                                                                                            arguments = arguments ;
                                                                                            file = file ;
                                                                                            status = status ;
                                                                                            expected = expected ;
                                                                                        } ;
                                                                                in builtins.map identity tests ;
                                                                    } ;
                                                            in identity ( value ignore ) ;
                                                filter =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then
                                                            let
                                                                d = defaults value null ;
                                                                predicate =
                                                                    test :
                                                                        let
                                                                            observation-derivation =
                                                                                test :
                                                                                    pkgs.mkDerivation
                                                                                        {
                                                                                            installPhase =
                                                                                                let
                                                                                                    command = temporary-derivation d.init d.release test.post ;
                                                                                                    arguments = if builtins.typeOf test.arguments == "null" then "" else "${ test.arguments }" ;
                                                                                                    file = if builtins.typeOf test.file == "null" then "" else " < ${ builtins.toFile "test" test.file }" ;
                                                                                                    paste = if builtins.typeOf test.paste == "null" then "" else "${ pkgs.coreutils }/bin/echo ${ test.paste } |" ;
                                                                                                    pipe = if builtins.typeOf test.pipe == "null" then "" else "${ pkgs.coreutils }/bin/echo ${ test.pipe } |" ;
                                                                                                    sub = "$( ${ pipe }${ command }${ arguments }${ file }" ;
                                                                                                    pass = "if ! ${ paste }${ sub } ; then ; fi" ;
                                                                                                    fail = "if ${ sub } ; then ; fi ;" ;
                                                                                                    reps = builtins.genList ( index : if test.status then pass else fail ) test.count ;
                                                                                                    ultimate =
                                                                                                        [
                                                                                                            ''OBSERV
                                                                                                            "if [ -z \"$( ${ pkgs.diffutils }/bin/diff ${ d.expected } /build/observed )\" ] ; then ${ pkgs.coreutils }/bin/touch $out ; else ${ pkgs.coreutils }/bin/cat /build/observed > $out && exit 66 ; fi" ;
                                                                                                    in
                                                                                                        ''
                                                                                                            ${ builtins.concatStringsSep " &&\n\t" ( builtins.genList ( index : if test.status then pass else fail ) test.count ) } &&
                                                                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                                                ${ pkgs.coreutils }/bin/ln --symbolic ${ expected } $out/expected &&
                                                                                                                ${ pkgs.coreutils }/bin/cat /build/observed > $out/observed &&
                                                                                                                ${ pkgs.diffutils }/bin/diff --brief
                                                                                                                 --recursive --side-by-side $out/expected $out/observed > $out/diff
                                                                                                        ''
                                                                                            name = "test-observation" ;
                                                                                            src = ./. ;
                                                                                        } ;
                                                                            in
                                                                in builtins.all predicate d.tests ;
                                                        else if builtins.typeOf value == "list" then true
                                                        else if builtins.typeOf value == "null" then true
                                                        else if builtins.typeOf value == "set" then true
                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for filtering initialization is not lambda, list, null, nor set but ${ builtins.typeOf value }." ;
                                                lambda =
                                                    path : name : value : ignore :
                                                        let
                                                            d = defaults value ignore ;
                                                            in temporary-derivation d.init d.release d.post ;
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
                                                                            ${ if builtins.typeOf init == "null" then "${ pkgs.coreutils }/bin/true init" else "${ pkgs.coreutils }/bin/ln --symbolic ${ init } $out/init" } &&
                                                                            ${ if builtins.typeOf release == "null" then "${ pkgs.coreutils }/bin/true release" else "${ pkgs.coreutils }/bin/ln --symbolic ${ release } $out/release" } &&
                                                                            ${ if builtins.typeOf post == "null" then "${ pkgs.coreutils }/bin/true post" else "${ pkgs.coreutils }/bin/ln --symbolic ${ post } $out/post" } &&
                                                                            ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/setup.sh" } > $out/setup.sh &&
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
                                                                                --set POST $out/post \
                                                                                --set RELEASE $out/release \
                                                                                --set RESOURCE_MASK ${ resource-mask } \
                                                                                --set TEARDOWN_ASYNCH $out/teardown-asynch \
                                                                                --set TEARDOWN_SYNCH $out/teardown-synch \
                                                                                --set TEE ${ pkgs.coreutils }/bin/tee &&
                                                                            ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/teardown-asynch.sh" } > $out/teardown-asynch.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0550 $out/teardown-asynch.sh &&
                                                                            makeWrapper \
                                                                                $out/teardown-asynch.sh \
                                                                                $out/teardown-asynch \
                                                                                --set AT ${ at } \
                                                                                --set ECHO ${ pkgs.coreutils }/bin/echo \
                                                                                --set NICE ${ pkgs.coreutils }/bin/nice \
                                                                                --set TEARDOWN_SYNCH $out/teardown-synch &&
                                                                            ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/teardown-synch.sh" } > $out/teardown-synch.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0550 $out/teardown-synch.sh &&
                                                                            makeWrapper \
                                                                                $out/teardown-synch.sh \
                                                                                $out/teardown-synch \
                                                                                --set BASENAME ${ pkgs.coreutils }/bin/basename \
                                                                                --set CHMOD ${ pkgs.coreutils }/bin/chmod \
                                                                                --set ECHO ${ pkgs.coreutils }/bin/echo \
                                                                                --set FIND ${ pkgs.findutils }/bin/find \
                                                                                --set FLOCK ${ pkgs.flock }/bin/flock \
                                                                                --set RM ${ pkgs.coreutils }/bin/rm \
                                                                                --set TAIL ${ pkgs.coreutils }/bin/tail
                                                                    '' ;
                                                                name = "temporary-derivation" ;
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
                                                                if builtins.typeOf value == "lambda" then resolve derivation path name
                                                                else if builtins.typeOf value == "list" then
                                                                    let
                                                                        generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                        in builtins.genList generator ( builtins.length value )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) value
                                                                else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for harvest is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                        in builtins.mapAttrs ( mapper [ ] ) dependencies ;
                                            } ;
                                        is-file = { name ? "IS_FILE" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-interactive = { name ? "IS_INTERACTIVE" } : "--run 'export ${ name }=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-pipe = { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        parent-pid = { name ? "PARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                                        resolve = derivation : path : name : builtins.concatStringsSep "/" ( builtins.map builtins.toString [ derivation ( builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.toJSON ( builtins.concatLists [ path [ name ] ] ) ) ) ) ] ) ;
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