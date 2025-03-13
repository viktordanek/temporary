{
    inputs =
        {
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
            shell-script.url = "github:viktordanek/shell-script" ;
            visitor.url = "github:viktordanek/visitor" ;
        } ;
    outputs =
        { flake-utils , nixpkgs , self , shell-script , visitor } :
            let
                fun =
                    system :
                        let
                            _shell-script = builtins.getAttr system shell-script.lib ;
                            _visitor = builtins.getAttr system visitor.lib ;
                            lib =
                                {
                                    at ? "/run/wrappers/bin/at" ,
                                    host-path ,
                                    init ? null ,
                                    initializer ? 64 ,
                                    post ? null ,
                                    release ? null ,
                                    standard-error ? 65 ,
                                    tests ? null
                                } :
                                    let
                                        mounts =
                                            {
                                                "/temporary" = primary.host-path ;
                                            } ;
                                        primary =
                                            {
                                                at = if builtins.typeOf at == "string" then at else builtins.throw "at is not string but ${ builtins.typeOf at }." ;
                                                host-path = if builtins.typeOf host-path == "string" then host-path else builtins.throw "host-path is not string but ${ builtins.typeOf host-path }." ;
                                                init = if builtins.typeOf init == "null" then init else if builtins.typeOf init == "string" then init else builtins.throw "init is not null, string but ${ builtins.typeOf init }." ;
                                                initializer = if builtins.typeOf initializer == "int" then initializer else builtins.throw "initializer is not int but ${ builtins.typeOf initializer }." ;
                                                release = if builtins.typeOf release == "null" then release else if builtins.typeOf release == "string" then release else builtins.throw "release is not null, string but ${ builtins.typeOf release }." ;
                                                post = if builtins.typeOf post == "null" then post else if builtins.typeOf post == "string" then post else builtins.throw "post is not null, string but ${ builtins.typeOf post }." ;
                                                standard-error = if builtins.typeOf standard-error == "int" then standard-error else builtins.throw "standard-error is not int but ${ builtins.typeOf standard-error }." ;
                                                tests = if builtins.typeOf tests == "null" then tests else if builtins.typeOf tests == "list" then tests else if builtins.typeOf tests == "set" then tests else builtins.throw "tests is not null, list, set but ${ builtins.typeOf tests }." ;
                                            } ;
                                        setup =
                                            init : release : post :
                                                let
                                                    setup =
                                                        source
                                                            ( self + "/scripts/setup.sh" )
                                                            [
                                                                [ ( builtins.any ( x : builtins.typeOf x == "string" ) [ init release post ] ) 2 2 ]
                                                                [ true 4 23 ]
                                                                [ ( builtins.typeOf init == "string" ) 25 25 ]
                                                                [ ( builtins.typeOf release == "string" ) 28 28 ]
                                                                [ ( builtins.typeOf post == "string" ) 31 31 ]
                                                                [ true 33 34 ]
                                                                [ ( builtins.typeOf init == "string" ) 36 60 ]
                                                                [ true 62 62 ]
                                                            ] ;
                                                    source =
                                                        file : lines :
                                                            pkgs.stdenv.mkDerivation
                                                                {
                                                                    installPhase =
                                                                        ''
                                                                            ${ pkgs.gnused }/bin/sed -n ${ builtins.concatStringsSep " " ( builtins.concatLists ( builtins.map ( x : if builtins.elemAt x 0 then [ "-e ${ builtins.toString ( builtins.elemAt x 1 ) },${ builtins.toString ( builtins.elemAt x 2 ) }p " ] else [ ] ) lines ) ) } ${ file } > $out &&
                                                                                ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                        '' ;
                                                                    name = "source" ;
                                                                    src = ./. ;
                                                                } ;
                                                    teardown-asynch = source ( self + "/scripts/teardown-asynch.sh" ) [ [ true 1 1 ] ] ;
                                                    teardown-synch =
                                                        source
                                                            ( self + "/scripts/teardown-synch.sh" )
                                                            [
                                                                [ true 1 6 ]
                                                                [ ( builtins.typeOf release == "string" ) 8 15 ]
                                                                [ ( builtins.typeOf post == "string" ) 17 17 ]
                                                                [ ( builtins.typeOf release == "string" ) 21 24 ]
                                                                [ true 26 29 ]
                                                            ] ;
                                                    in
                                                        pkgs.stdenv.mkDerivation
                                                            {
                                                                installPhase =
                                                                    let
                                                                        environment =
                                                                            builtins.concatLists
                                                                                [
                                                                                    [
                                                                                        "--set AT ${ primary.at }"
                                                                                        "--set CAT ${ pkgs.coreutils }/bin/cat"
                                                                                        "--set CHMOD ${ pkgs.coreutils }/bin/chmod"
                                                                                        "--set ECHO ${ pkgs.coreutils }/bin/echo"
                                                                                        "--set FLOCK ${ pkgs.flock }/bin/flock"
                                                                                        "--run 'export GRANDPARENT_PID=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'"
                                                                                        "--run 'export IS_FILE=$( if [ -f 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"
                                                                                        "--run 'export IS_PIPE=$( if [ -p 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"
                                                                                        "--run 'export IS_INTERACTIVE=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"
                                                                                        "--set MAKE_WRAPPER ${ pkgs.makeWrapper }"
                                                                                        "--set LN ${ pkgs.coreutils }/bin/ln"
                                                                                    ]
                                                                                    ( if builtins.typeOf init == "string" then [ "--set MAKE_WRAPPER_INIT ${ init }" ] else [ ] )
                                                                                    ( if builtins.typeOf release == "string" then [ "--set MAKE_WRAPPER_RELEASE ${ release }" ] else [ ] )
                                                                                    ( if builtins.typeOf post == "string" then [ "--set MAKE_WRAPPER_POST ${ post }" ] else [ ] )
                                                                                    [
                                                                                        "--set NICE ${ pkgs.coreutils }/bin/nice"
                                                                                        "--run 'export PARENT_PID=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'"
                                                                                        "--run 'export RESOURCE=$( ${ pkgs.coreutils }/bin/mktemp --directory /tmp/RESOURCE.XXXXXXXX )'"
                                                                                        "--set RM ${ pkgs.coreutils }/bin/rm"
                                                                                        "--set TAIL ${ pkgs.coreutils }/bin/tail"
                                                                                        "--run 'export TARGET=${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/target'"
                                                                                        "--set TEARDOWN_ASYNCH ${ teardown-asynch }"
                                                                                        "--set TEARDOWN_SYNCH ${ teardown-synch }"
                                                                                        "--set TRUE ${ pkgs.coreutils }/bin/true"
                                                                                    ]
                                                                                ] ;
                                                                        in
                                                                            ''
                                                                                makeWrapper ${ setup } $out ${ builtins.concatStringsSep " " environment }
                                                                            '' ;
                                                                name = "bin" ;
                                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                                src = ./. ;
                                                            } ;
                                        util =
                                            _shell-script
                                                {
                                                    extensions =
                                                        [
                                                            {
                                                                name = "is-interactive" ;
                                                                value = "--run 'export IS_INTERACTIVE=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"  ;
                                                            }
                                                            {
                                                                name = "is-pipe" ;
                                                                value = "--run 'export IS_PIPE=$( if [ -p 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"  ;
                                                            }
                                                            {
                                                                name = "is-file" ;
                                                                value = "--run 'export IS_FILE=$( if [ -f 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"  ;
                                                            }
                                                            {
                                                                name = "grandparent-pid" ;
                                                                value =  "--run 'export GRANDPARENT_PID=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                                                            }
                                                            {
                                                                name = "parent-pid" ;
                                                                value =  "--run 'export PARENT_PID=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                                                            }
                                                            {
                                                                name = "resource" ;
                                                                value = "--run 'export RESOURCE=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                            }
                                                            {
                                                                name = "resource-setup" ;
                                                                value = "--run 'export _RESOURCE=$( ${ pkgs.coreutils }/bin/mktemp --directory --directory /temporary/XXXXXXXX )'" ;
                                                            }
                                                        ] ;
                                                    mounts = mounts ;
                                                    shell-scripts =
                                                        let
                                                            splits =
                                                                splits :
                                                                    builtins.concatStringsSep
                                                                        " "
                                                                        (
                                                                            builtins.concatLists
                                                                                (
                                                                                    builtins.map ( s : if builtins.elemAt s 0 then [ "-e ${ builtins.toString ( builtins.elemAt s 1 ) },${ builtins.toString ( builtins.elemAt s 2 ) }p" ] else [ ] ) splits
                                                                                )
                                                                        ) ;
                                                            in
                                                                {
                                                                    setup =
                                                                        let
                                                                            fun =
                                                                                init : release : post : ignore :
                                                                                    {
                                                                                        environment =
                                                                                            { grandparent-pid , is-interactive , is-file , is-pipe , parent-pid , resource-setup , self , string , ... } :
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        [
                                                                                                            ( resource-setup )
                                                                                                        ]
                                                                                                        [
                                                                                                            ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                            ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                            ( grandparent-pid )
                                                                                                            ( is-file )
                                                                                                            ( is-interactive )
                                                                                                            ( is-pipe )
                                                                                                            ( string "LN" "${ pkgs.coreutils }/bin/ln" )
                                                                                                        ]
                                                                                                        ( if ! ( init || release || post ) then [ ( string "MAKE_WRAPPER" "${ pkgs.makeWrapper }" ) ] else [ ] )
                                                                                                        [
                                                                                                            ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                                            ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                                            ( self "TEARDOWN_ASYNCH" ( self : self.teardown-asynch ) )
                                                                                                            ( self "TEARDOWN_SYNCH" ( self : self.teardown-synch.${ if release then "true" else "false" }.${ if post then "true" else "false" } ) )
                                                                                                            ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                                                        ]
                                                                                                    ] ;
                                                                                        script =
                                                                                            pkgs.stdenv.mkDerivation
                                                                                                {
                                                                                                    installPhase =
                                                                                                        let
                                                                                                            lines =
                                                                                                                splits
                                                                                                                    [
                                                                                                                        [ ( ! ( init || release || post ) ) 1 1 ]
                                                                                                                        [ true 1 23 ]
                                                                                                                        [ init 25 25 ]
                                                                                                                        [ release 28 28 ]
                                                                                                                        [ post 31 31 ]
                                                                                                                        [ true 33 34 ]
                                                                                                                        [ init 36 60 ]
                                                                                                                    ] ;
                                                                                                            in
                                                                                                                ''
                                                                                                                    ${ pkgs.gnused }/bin/sed -n ${ lines } > $out &&
                                                                                                                        ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                                                                '' ;
                                                                                                    name = "setup" ;
                                                                                                    src = ./. ;
                                                                                                } ;
                                                                                    } ;
                                                                            in
                                                                                {
                                                                                    false =
                                                                                        {
                                                                                            false =
                                                                                                {
                                                                                                    false = fun false false false ;
                                                                                                    true = fun false false true ;
                                                                                                } ;
                                                                                            true =
                                                                                                {
                                                                                                    false = fun false true false ;
                                                                                                    true = fun false true true ;
                                                                                                } ;
                                                                                        } ;
                                                                                } ;
                                                                    teardown-asynch =
                                                                        ignore :
                                                                            {
                                                                                environment =
                                                                                    { resource , string , ... } :
                                                                                        [
                                                                                            ( string "AT" "${ primary.at }" )
                                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                            ( string "NICE" "${ pkgs.coreutils }/bin/nice" )
                                                                                            ( resource )
                                                                                        ] ;
                                                                                script = self + "/scripts/teardown-asynch.sh" ;
                                                                            } ;
                                                                    teardown-synch =
                                                                        let
                                                                            fun =
                                                                                release : post : ignore :
                                                                                    {
                                                                                        environment =
                                                                                            { string , ... } :
                                                                                                [
                                                                                                    ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                    ( string "FLOCK" "${ pkgs.coreutils }/bin/flock" )
                                                                                                    ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                                    ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                                                ] ;
                                                                                        script =
                                                                                            pkgs.stdenv.mkDerivation
                                                                                                {
                                                                                                    installPhase =
                                                                                                        let
                                                                                                            lines =
                                                                                                                splits
                                                                                                                    [
                                                                                                                        [ true 1 6 ]
                                                                                                                        [ release 8 15 ]
                                                                                                                        [ post 17 17 ]
                                                                                                                        [ release 21 24 ]
                                                                                                                        [ true 26 29 ]
                                                                                                                    ] ;
                                                                                                            in
                                                                                                                ''
                                                                                                                    ${ pkgs.gnused }/bin/sed -n ${ lines } > $out &&
                                                                                                                        ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                                                                '' ;
                                                                                                    name = "teardown-asynch" ;
                                                                                                    src = ./. ;
                                                                                                } ;
                                                                                    } ;
                                                                            in
                                                                                {
                                                                                    false =
                                                                                        {
                                                                                            false = fun false false ;
                                                                                            true = fun false true ;
                                                                                        } ;
                                                                                    true =
                                                                                        {
                                                                                            false = fun true false ;
                                                                                            true = fun true true ;
                                                                                        } ;
                                                                                } ;
                                                                        } ;
                                                } ;
                                        in
                                            {
                                                temporary = setup primary.init primary.release primary.post ;
                                                tests =
                                                    pkgs.stdenv.mkDerivation
                                                        {
                                                            installPhase =
                                                                let
                                                                    constructors =
                                                                        _visitor
                                                                            {
                                                                                lambda =
                                                                                    path : value :
                                                                                        let
                                                                                            secondary =
                                                                                                let
                                                                                                    identity =
                                                                                                        {
                                                                                                            arguments ? null ,
                                                                                                            count ? 2 ,
                                                                                                            expected ,
                                                                                                            file ? null ,
                                                                                                            paste ? null ,
                                                                                                            pipe ? null ,
                                                                                                            status ? true
                                                                                                        } :
                                                                                                            {
                                                                                                                arguments = if builtins.typeOf arguments == "null" then arguments else if builtins.typeOf arguments == "string" then arguments else builtins.throw "arguments is not null, string but ${ builtins.typeOf file }." ;
                                                                                                                count = if builtins.typeOf count == "int" then count else builtins.throw "count is not int but ${ builtins.typeOf count }." ;
                                                                                                                expected = if builtins.typeOf expected == "string" then expected else builtins.throw "expected is not string but ${ builtins.typeOf expected }." ;
                                                                                                                file = if builtins.typeOf file == "null" then file else if builtins.typeOf file == "string" then file else builtins.throw "file is not null, string but ${ builtins.typeOf file }." ;
                                                                                                                paste = if builtins.typeOf paste == "null" then paste else if builtins.typeOf paste == "string" then paste else builtins.throw "paste is not null, string but ${ builtins.typeOf paste }." ;
                                                                                                                pipe = if builtins.typeOf pipe == "null" then pipe else if builtins.typeOf paste == "string" then pipe else builtins.throw "pipe is not null, string but ${ builtins.typeOf paste }." ;
                                                                                                                status = if builtins.typeOf status == "bool" then status else builtins.throw "status is not bool but ${ builtins.typeOf status }." ;
                                                                                                            } ;
                                                                                                    in identity ( value null ) ;
                                                                                            test =
                                                                                                let
                                                                                                    arguments = if builtins.typeOf secondary.arguments == "null" then "candidate" else "candidate ${ secondary.arguments }" ;
                                                                                                    pipe = if builtins.typeOf secondary.pipe == "null" then arguments else "${ pkgs.coreutils }/bin/echo ${ secondary.pipe } | ${ arguments }" ;
                                                                                                    file = if builtins.typeOf secondary.file == "null" then pipe else "${ pipe } < ${ builtins.toFile "file" secondary.file }" ;
                                                                                                    paste = if builtins.typeOf secondary.paste == "null" then file else "${ pkgs.coreutils }/bin/echo ${ secondary.paste } > $( ${ file } )" ;
                                                                                                    status = if secondary.status then "if ! ${ paste } > /tmp/null ; then exit 74 ; fi" else "if ${ paste } > /dev/null ; then exit 84 ; fi" ;
                                                                                                    count = builtins.concatStringsSep " &&\n\t" ( builtins.genList ( index : status ) secondary.count ) ;
                                                                                                    in pkgs.writeShellScript "test-candidate" ( builtins.trace count count ) ;
                                                                                            user-environment =
                                                                                                pkgs.buildFHSUserEnv
                                                                                                    {
                                                                                                        extraBwrapArgs =
                                                                                                            [
                                                                                                                "--bind ${ builtins.concatStringsSep "" [ "$" "{" "POST" "}" ] } /post"
                                                                                                            ] ;
                                                                                                        name = "test-candidate" ;
                                                                                                        runScript = test ;
                                                                                                        targetPkgs = pkgs : [ ( pkgs.writeShellScriptBin "candidate" ( setup primary.init primary.release primary.post ) ) ] ;
                                                                                                    } ;
                                                                                            in
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        [
                                                                                                            "${ pkgs.coreutils }/bin/cp --recursive --preserve=mode ${ secondary.expected } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "expected" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                            "export POST=$( ${ pkgs.coreutils }/bin/mktemp --directory )"
                                                                                                            "${ user-environment }/bin/test-candidate"
                                                                                                            "${ pkgs.coreutils }/bin/mv ${ builtins.concatStringsSep "" [ "$" "{" "POST" "}" ] } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "observed" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                            "${ pkgs.coreutils }/bin/cat '${ test }' > ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                            "${ pkgs.coreutils }/bin/echo $out"
                                                                                                            "${ pkgs.diffutils }/bin/diff --recursive ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "expected" ] ( builtins.map builtins.toJSON path ) ] ) } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "observed" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                        ]
                                                                                                    ] ;
                                                                            }
                                                                            {
                                                                                list =
                                                                                    path : list :
                                                                                        builtins.concatLists
                                                                                            [
                                                                                                [
                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "expected" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "observed" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                ]
                                                                                                ( builtins.concatLists list )
                                                                                            ] ;
                                                                                set =
                                                                                    path : set :
                                                                                        builtins.concatLists
                                                                                            [
                                                                                                [
                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "expected" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "observed" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                ]
                                                                                                ( builtins.concatLists ( builtins.attrNames set set ) )
                                                                                            ] ;
                                                                            }
                                                                            primary.tests ;
                                                                    in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ [ "${ pkgs.coreutils }/bin/mkdir $out" ] constructors  [ "${ pkgs.coreutils }/bin/echo $out" "exit 64" ] ] ) ;
                                                            name = "tests" ;
                                                            src = ./. ;
                                                        } ;
                                                util = util ;
                                            } ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                let
                                    scripts =
                                        _shell-script
                                            {
                                                extensions =
                                                    [
                                                        # {
                                                        #     name = "resource" ;
                                                        #     value =  "--run 'export RESOURCE=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                        # }
                                                        # {
                                                        #     name = "target" ;
                                                        #     value =  "--run 'export TARGET=$( ${ pkgs.coreutils }/bin/dirname $( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } ) )'" ;
                                                        # }
                                                    ] ;
                                                mounts =
                                                    {
                                                        "/temporary" = "$( ${ pkgs.coreutils }/bin/mktemp --directory )" ;
                                                        "/post" = "$( ${ pkgs.coreutils }/bin/mktemp --directory )" ;
                                                    } ;
                                                shell-scripts =
                                                    {
                                                        executable =
                                                            ignore :
                                                                {
                                                                    environment =
                                                                        let
                                                                            template-file = self + "/scripts/executable.json" ;
                                                                            in
                                                                                { self , path , standard-input , string } :
                                                                                    [
                                                                                        ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                        ( self "FOOBAR" ( self : self.foobar ) )
                                                                                        ( string "JQ" "${ pkgs.jq }/bin/jq" )
                                                                                        ( path "NAME" 0 )
                                                                                        # ( resource )
                                                                                        ( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
                                                                                        ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                        # ( string "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" "${ builtins.concatStringsSep "" [ "$" "{" "TARGET" "}" ] }" )
                                                                                        # ( target )
                                                                                        ( string "STANDARD_ERROR" "\"\"" )
                                                                                        ( string "STANDARD_OUTPUT" "9c8f38b45d5d275508221e29f424d0c796210f658cb55e62e13adc793f8f91c58567c7eaf116a6e844dc26f49ced8572a4582e5ab977bfb8ba0da62258653ee6" )
                                                                                        ( string "STATUS" 0 )
                                                                                        ( string "TEMPLATE_FILE" template-file )
                                                                                    ] ;
                                                                    script = self + "/scripts/executable.sh" ;
                                                                    tests = null ;
                                                                } ;
                                                        foobar =
                                                            ignore :
                                                                {
                                                                    environment =
                                                                        { path , self , standard-input , string , ... } :
                                                                            [
                                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                ( string "CUT" "${ pkgs.coreutils }/bin/cut" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( self "FOOBAR" ( self : self.foobar ) )
                                                                                ( path "NAME" 0 )
                                                                                ( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
                                                                                ( standard-input { name = "ceb56d2bcebc8e9cc485a093712de696d47b96ca866254795e566f370e2e76d92d7522558aaf4e9e7cdd6b603b527cee48a1af68a0abc1b68f2348f055346408" ; } )
                                                                                ( string "TOKEN" "7861c7b30f4c436819c890600b78ca11e10494c9abea9cae750c26237bc70311b60bb9f8449b32832713438b36e8eaf5ec719445e6983c8799f7e193c9805a7" )
                                                                                ( string "TR" "${ pkgs.coreutils }/bin/tr" )
                                                                            ] ;
                                                                    script = self + "/scripts/foobar.sh" ;
                                                                    tests =
                                                                        [
                                                                            (
                                                                                ignore :
                                                                                   {
                                                                                        error = "50885ccf7ec0a2420f1c7555e54df8512508f93002313cfd71d6de510f8a8a6c035beca3589f2a5248069e02f57535ef3231004cd8d40f8a79b28d605fb6f89b" ;
                                                                                        mounts =
                                                                                            {
                                                                                                "/post" =
                                                                                                    {
                                                                                                        expected = self + "/mounts/QoqNiM1R" ;
                                                                                                        initial = self + "/mounts/QoqNiM1R" ;
                                                                                                    } ;
                                                                                                "/temporary" =
                                                                                                    {
                                                                                                        expected = self + "/mounts/RSGhGwNk" ;
                                                                                                        initial = self + "/mounts/QoqNiM1R" ;
                                                                                                    } ;
                                                                                            } ;
                                                                                        output = "45c6ae4c0d3b624d4aa46d90b1ff7dfc996f05827014339549e01b3cb4465cde65493280935d121481c08871aac8ef4739253347e132411d2a1d5075c66bf067" ;
                                                                                        test = "candidate c64de1b7282c845986c0cf68c2063a11974e7eb0182f30a315a786c071bd253b6e97ce0afbfb774659177fdf97471f9637b07a1e5c0dff4c6c3a5dfcb05f0a50" ;
                                                                                        status = 35 ;
                                                                                    }
                                                                            )
                                                                        ] ;
                                                                } ;
                                                        vacuum =
                                                            ignore :
                                                                {
                                                                    environment =
                                                                        { string , ... } :
                                                                            [
                                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                ( string "DIFF" "${ pkgs.coreutils }/bin/diff" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                ( string "MV" "${ pkgs.coreutils }/bin/mv" )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                            ] ;
                                                                    script = self + "/scripts/vacuum.sh" ;
                                                                } ;
                                                    } ;
                                            } ;
                                        temporary =
                                            lib
                                                {
                                                    at = "/run/wrappers/bin/at" ;
                                                    host-path = "$( ${ pkgs.coreutils }/bin/mktemp --directory )" ;
                                                    init = scripts.shell-scripts.executable ;
                                                    initializer = 66 ;
                                                    post = scripts.shell-scripts.vacuum ;
                                                    release = scripts.shell-scripts.executable ;
                                                    standard-error = 67 ;
                                                    tests =
                                                        [
                                                            (
                                                                ignore :
                                                                    {
                                                                        count = 1 ;
                                                                        expected = self + "mounts/B0hwDMGO" ;
                                                                        # test = "candidate ff2d4ae2261b9c3cf783e38158bdbac15471ca106ca7d6070b9bd7683f0c2adad9304508051babb35bd0721237070c7657de06ff5a29b0b9572230546876f94a" ;
                                                                        status = true ;
                                                                    }
                                                            )
                                                        ] ;
                                                } ;
                                    in
                                        {
                                            checks =
                                                {
                                                    foobar =
                                                        pkgs.stdenv.mkDerivation
                                                            {
                                                                installPhase =
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/touch $out &&
                                                                            # ${ pkgs.coreutils }/bin/echo ${ temporary.temporary } &&
                                                                            # ${ pkgs.coreutils }/bin/echo ${ temporary.tests } &&
                                                                            exit 62
                                                                    '' ;
                                                                name = "foobar" ;
                                                                src = ./. ;
                                                            } ;
                                                    # shell-script = scripts.tests ;
                                                    # util = temporary.util.tests ;
                                                    # temporary = temporary.tests ;
                                                } ;
                                            lib = lib ;
                                        } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}