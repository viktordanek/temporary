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
                                    temporary ? { } ,
                                    temporary-initialization-error-standard-error ? 64 ,
                                    temporary-initialization-error-initializer ? 65 ,
                                    temporary-path ? "ae67680146758d609c87886765e9778fba6b9f0bf565ccf48468833c46115a1e9a3faa641f437f5aea0c150c9030892c82d4648fdb6f4e744673c8ccf63e7e16" ,
                                    temporary-resource-mask ? "temporary.XXXXXXXX" ,
                                    whitelist ? [ ]
                                } :
                                    let
                                        dependencies =
                                            {
                                                temporary =
                                                    let
                                                        lambda =
                                                            path : name : value :
                                                                let
                                                                    identity =
                                                                        {
                                                                            init ? builtins.null ,
                                                                            post ? builtins.null ,
                                                                            release ? builtins.null
                                                                        } :
                                                                            let
                                                                                guard =
                                                                                    candidate :
                                                                                        if builtins.any ( c : c == candidate ) whitelist then builtins.throw
                                                                                            ''
                                                                                                ❌ Guard error: The candidate value "${ builtins.toJSON candidate }" is not whitelisted.

                                                                                                ▶ What happened?
                                                                                                  - This candidate and is not approved for use.

                                                                                                ▶ What should you do?
                                                                                                  1. Ensure this candidate is valid and safe for use.
                                                                                                  2. Temporarily add to the whitelist and add test coverage for this candidate to verify its behavior.
                                                                                                  3. If the tests pass, merge the test and whitelist changes.  You may use this candidate.
                                                                                                  4. If the tests fail, discard the test and whitelist changes.  You may not use this candidate.
                                                                                            ''
                                                                                        else candidate ;
                                                                                in
                                                                                    {
                                                                                        init =
                                                                                            if builtins.typeOf init == "lambda" then guard init
                                                                                            else if builtins.typeOf init == "null" then builtins.null
                                                                                            else throw path name value [ "lambda" "null" ] ;
                                                                                        post =
                                                                                            if builtins.typeOf post == "lambda" then post
                                                                                            else if builtins.typeOf post == "null" then builtins.null
                                                                                            else throw path name value [ "lambda" "null" ] ;
                                                                                        release =
                                                                                            if builtins.typeOf release == "lambda" then guard release
                                                                                            else if builtins.typeOf release == "null" then builtins.null
                                                                                            else throw path name value [ "lambda" "null" ] ;
                                                                                    } ;
                                                                    shell-script =
                                                                        {
                                                                            environment ? inject : [ ] ,
                                                                            executable
                                                                        } :
                                                                            path : name : binary :
                                                                                builtins.concatStringsSep
                                                                                    " "
                                                                                    (
                                                                                        builtins.concatLists
                                                                                            [
                                                                                                (
                                                                                                    if builtins.typeOf executable == "string" then
                                                                                                        [
                                                                                                            "makeWrapper"
                                                                                                            ( pkgs.writeShellScript "executable" ( builtins.readFile ( caller + ( builtins.concatStringsSep "" [ "/" executable ] ) ) ) )
                                                                                                            "${ resolve path name }/${ binary }"
                                                                                                        ]
                                                                                                    else throw path name value [ "string" ]
                                                                                                )
                                                                                                (
                                                                                                    let
                                                                                                        injection =
                                                                                                            {
                                                                                                                string = name : value : "--set ${ name } ${ builtins.toString value }" ;
                                                                                                            } ;
                                                                                                        in
                                                                                                            if builtins.typeOf environment == "lambda" then
                                                                                                                let
                                                                                                                    mapper = value : if builtins.typeOf value == "string" then value else throw path name value [ "string" ] ;
                                                                                                                    in builtins.map mapper ( environment injection )
                                                                                                            else throw path name value [ "lambda" ]
                                                                                                )
                                                                                            ]
                                                                                    ) ;
                                                                    in ignore : identity ( value shell-script ) ;
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then lambda path name value
                                                                else if builtins.typeOf value == "list" then
                                                                    let
                                                                        generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                        in builtins.genList generator ( builtins.length value )
                                                                else if builtins.typeOf value == "null" then lambda path name ( script : { } )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                else throw path name value [ "null" "set" ] ;
                                                        in builtins.mapAttrs ( mapper [ "temporary" ] ) temporary ;
                                            } ;
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    name = "temporary-implementation" ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    src = ./. ;
                                                    installPhase =
                                                        let
                                                            mapper =
                                                                path : name : value :
                                                                    if builtins.typeOf value == "lambda" then
                                                                        let
                                                                            computed = value builtins.null ;
                                                                            in
                                                                                builtins.concatLists
                                                                                [
                                                                                    [
                                                                                        "source ${ builtins.concatStringsSep "" [ "$" "{" "MAKE_WRAPPER" "}" ] }/nix-support/setup-hook"
                                                                                    ]
                                                                                    [
                                                                                         "${ pkgs.coreutils }/bin/mkdir ${ resolve path name }"
                                                                                    ]
                                                                                    (
                                                                                        if computed.init == null then [ ]
                                                                                        else [ (  computed.init path name "init.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.release == null then [ ]
                                                                                        else [ ( computed.release path name "release.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.post == null then [ ]
                                                                                        else [ ( computed.post path name "post.sh" ) ]
                                                                                    )
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/setup.sh" } ${ resolve path name }/setup.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ resolve path name }/setup.sh"
                                                                                        "makeWrapper ${ resolve path name }/setup.sh ${ resolve path name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo ${ grandparent-pid pkgs { } } ${ is-file pkgs { } } ${ is-interactive pkgs { } } ${ is-pipe pkgs { } } --set GREP ${ pkgs.gnugrep }/bin/grep --set INIT ${ resolve path name }/init.sh  --set INITIALIZATION_ERROR_STANDARD_ERROR ${ builtins.toString temporary-initialization-error-standard-error } --set INITIALIZATION_ERROR_INITIALIZER ${ builtins.toString temporary-initialization-error-initializer } --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ resolve path name }/release.sh ${ parent-pid pkgs { } } --set POST ${ resolve path name }/post.sh --set RM ${ pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set TEARDOWN_ASYNCH ${ resolve path name }/teardown-asynch --set TEARDOWN_SYNCH ${ resolve path name }/teardown-synch --set TEE ${ pkgs.coreutils }/bin/tee --set TEMPORARY_RESOURCE_MASK ${ temporary-resource-mask }"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-asynch.sh" } ${ resolve path name }/teardown-asynch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ resolve path name }/teardown-asynch.sh"
                                                                                        "makeWrapper ${ resolve path name }/teardown-asynch.sh ${ resolve path name }/teardown-asynch --set AT ${ at } --set ECHO ${ pkgs.coreutils }/bin/echo --set NICE ${ pkgs.coreutils }/bin/nice --run 'export TEARDOWN_SYNCH=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/teardown-synch.sh'"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-synch.sh" } ${ resolve path name }/teardown-synch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ resolve path name }/teardown-synch.sh"
                                                                                        "makeWrapper ${ resolve path name }/teardown-synch.sh ${ resolve path name }/teardown-synch --set BASENAME ${ pkgs.coreutils }/bin/basename --set CHMOD ${pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock  --set MV ${pkgs.coreutils }/bin/mv --run 'export RESOURCE=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )' --set RM ${pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set TRUE ${ pkgs.coreutils }/bin/true"
                                                                                    ]
                                                                                ]
                                                                    else if builtins.typeOf value == "list" then
                                                                        builtins.concatLists
                                                                            [
                                                                                (
                                                                                    let
                                                                                       generator =
                                                                                           index :
                                                                                               let
                                                                                                   n = builtins.toString index ;
                                                                                                   p = builtins.concatLists [ path [ name ] ] ;
                                                                                                   v = builtins.elemAt value index ;
                                                                                                  in mapper p n v ;
                                                                                       in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                                )
                                                                            ]
                                                                    else if builtins.typeOf value == "set" then
                                                                        builtins.concatLists
                                                                            [
                                                                                ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                            ]
                                                                    else throw path name value [ "lambda" "list" "set" ] ;
                                                            in
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                        ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                        ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.buildPackages.makeWrapper } $out/bin/makeWrapper &&
                                                                        ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "constructor" ( builtins.concatStringsSep " &&\n " ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "$out" ] ) dependencies ) ) ) ) } $out/bin/constructor.sh &&
                                                                        makeWrapper $out/bin/constructor.sh $out/bin/constructor --set MAKE_WRAPPER $out/bin/makeWrapper &&
                                                                        $out/bin/constructor
                                                                '' ;
                                                } ;
                                        harvest =
                                            derivation :
                                                let
                                                    mapper =
                                                        path : name : value :
                                                            if builtins.typeOf value == "lambda" then "${ resolve path name}/setup"
                                                            else if builtins.typeOf value == "list" then
                                                                let
                                                                    generator =
                                                                        index :
                                                                            let
                                                                                n = builtins.toString index ;
                                                                                p = builtins.concatLists [ path [ name ] ] ;
                                                                                v = builtins.elemAt value index ;
                                                                                in mapper p n v ;
                                                                    in builtins.genList generator ( builtins.length value )
                                                            else if builtins.typeOf value == "null" then "${ resolve path name }/setup"
                                                            else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                            else throw path name value [ "null" "set" ] ;
                                                    in ( builtins.mapAttrs ( mapper [ derivation ] ) { temporary = temporary ; } ) ;
                                        in harvest ( builtins.toString derivation ) ;
                            pkgs = import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        pkgs.stdenv.mkDerivation
                                            {
                                                name = "temporary-test" ;
                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                src = ./. ;
                                                installPhase =
                                                    let
                                                        resources =
                                                            {
                                                                idea =
                                                                    lib
                                                                        {
                                                                            at = "/run/wrappers/bin/at" ;
                                                                            caller = self ;
                                                                            temporary =
                                                                                {
                                                                                    null =
                                                                                        shell-script :
                                                                                            {
                                                                                                init =
                                                                                                    shell-script
                                                                                                        {
                                                                                                            environment = { string } : [ ( string "foobar" 1 ) ] ;
                                                                                                            executable = "scripts/test/temporary/executable.sh" ;
                                                                                                        } ;
                                                                                            } ;
                                                                                } ;
                                                                            temporary-initialization-error-standard-error = 66 ;
                                                                            temporary-initialization-error-initializer = 67 ;
                                                                            temporary-resource-mask = "temporary.idea.XXXXXXXX" ;
                                                                        } ;
                                                                observe = { } ;
                                                                util = { } ;
                                                            } ;
                                                        in
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/echo $out &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources.idea.temporary.null }
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                    grandparent-pid = pkgs : { name ? "GRANDPARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                    is-file = pkgs : { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                    is-interactive = pkgs : { name ? "IS_INTERACTIVE" } : "--run 'export ${ name }=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                    is-pipe = pkgs : { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                    parent-pid = pkgs : { name ? "PARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                    resolution =
                        path : name :
                            let
                                list =
                                    let
                                        generator = index : builtins.elemAt path ( index + 1 ) ;
                                        in builtins.genList generator ( ( builtins.length path ) - 1 ) ;
                                mapper = value : if builtins.typeOf value == "int" || builtins.typeOf value == "string" then builtins.toJSON value else builtins.throw "The path index is neither int nor string." ;
                                in builtins.concatStringsSep "/" ( builtins.map mapper ( builtins.concatLists [ list [ name ] ] ) ) ;
                    resolve = path : name : "${ builtins.elemAt path 0 }/${ builtins.hashString "sha512" ( resolution path name ) }" ;
                    throw =
                        path : name : value : valid :
                            if builtins.any ( v : v == builtins.typeOf value ) valid then value
                            else builtins.throw "The value defined at ${ resolution path name } is not ${ builtins.concatStringsSep ", " valid } but ${ builtins.typeOf value }." ;
                    trace = x : builtins.trace ( builtins.toJSON x ) x ;
                    in flake-utils.lib.eachDefaultSystem fun ;
}
