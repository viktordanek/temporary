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
                                                init = if builtins.typeOf init == "null" then init else if builtins.typeOf init == "lambda" then init else builtins.throw "init is not null, lambda but ${ builtins.typeOf init }." ;
                                                initializer = if builtins.typeOf initializer == "int" then initializer else builtins.throw "initializer is not int but ${ builtins.typeOf initializer }." ;
                                                release = if builtins.typeOf release == "null" then release else if builtins.typeOf release == "lambda" then release else builtins.throw "release is not null, lambda but ${ builtins.typeOf release }." ;
                                                post = if builtins.typeOf post == "null" then post else if builtins.typeOf post == "lambda" then post else builtins.throw "post is not null, lambda but ${ builtins.typeOf post }." ;
                                                standard-error = if builtins.typeOf standard-error == "int" then standard-error else builtins.throw "standard-error is not int but ${ builtins.typeOf standard-error }." ;
                                                tests = if builtins.typeOf tests == "null" then tests else if builtins.typeOf tests == "list" then tests else if builtins.typeOf tests == "set" then tests else builtins.throw "tests is not null, list, set but ${ builtins.typeOf tests }." ;
                                            } ;
                                        temporary =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    installPhase =
                                                        let
                                                            setup =
                                                                let
                                                                    reducer = previous : current : builtins.getAttr ( if builtins.typeOf current == "string" then "true" else "false" ) previous ;
                                                                    in builtins.foldl' reducer [ primary.init primary.release primary.post ] util.shell-scripts.setup ;
                                                            in
                                                                ''
                                                                    makeWrapper ${ setup } $out
                                                                '' ;
                                                    name = "temporary" ;
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
                                                                                                        # ( if init then [ ( string "MAKE_WRAPPER_INIT" "makeWrapper ${ init } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/init.sh" ) ] else [ ] )
                                                                                                        # ( if post then [ ( string "MAKE_WRAPPER_POST" "makeWrapper ${ post } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/post.sh" ) ] else [ ] )
                                                                                                        # ( if release then [ ( string "MAKE_WRAPPER_RELEASE" "makeWrapper ${ release } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/release.sh" ) ] else [ ] )
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
                                                                                                                    ${ pkgs.gnused }/bin/sed -n ${ builtins.trace lines lines } > $out &&
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
                                                temporary = temporary ;
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
                                                                                            candidate =
                                                                                                pkgs.stdenv.mkDerivation
                                                                                                    {
                                                                                                        installPhase =
                                                                                                            let
                                                                                                                init = if builtins.typeOf primary.init == "string" then [ primary.init ] else [ ] ;
                                                                                                                release = if builtins.typeOf primary.release == "string" then [ primary.release ] else [ ] ;
                                                                                                                post =
                                                                                                                    pkgs.stdenv.mkDerivation
                                                                                                                        {
                                                                                                                            installPhase =
                                                                                                                                let
                                                                                                                                    post =
                                                                                                                                        pkgs.stdenv.mkDerivation
                                                                                                                                            {
                                                                                                                                                installPhase =
                                                                                                                                                    ''
                                                                                                                                                        ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/vacuum.sh" } > $out &&
                                                                                                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                                                                                                    '' ;
                                                                                                                                                name = "post" ;
                                                                                                                                                src = ./. ;
                                                                                                                                            } ;
                                                                                                                                    in
                                                                                                                                        ''
                                                                                                                                            makeWrapper ${ post } $out --set CAT ${ pkgs.coreutils }/bin/cat --set DIFF ${ pkgs.diffutils }/bin/diff --set ECHO ${ pkgs.coreutils }/bin/echo --set FLOCK ${ pkgs.flock }/bin/flock --set MV ${ pkgs.coreutils }/bin/mv --set RM ${ pkgs.coreutils }/bin/rm
                                                                                                                                        '' ;
                                                                                                                            name = "post" ;
                                                                                                                            nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                                                                                            src = ./. ;
                                                                                                                        } ;
                                                                                                                setup =
                                                                                                                    let
                                                                                                                        reducer = previous : current : builtins.getAttr ( if current == "string" then "true" else "false" ) previous ;
                                                                                                                        in builtins.foldl' ( builtins.map builtins.typeOf [ primary.init primary.release "string" ] ) reducer util.shell-scripts.setup ;
                                                                                                                in
                                                                                                                    ''
                                                                                                                        ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                                                            ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                                                                            ${ pkgs.coreutils }/bin/touch $out/bin/candidate &&
                                                                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/candidate
                                                                                                                    '' ;
                                                                                                        name = "candidate" ;
                                                                                                        src = ./. ;
                                                                                                    } ;
                                                                                            script = pkgs.writeShellScript "test" ( builtins.concatStringsSep " &&\n\t" ( builtins.genList ( index : secondary.test ) secondary.count ) ) ;
                                                                                            secondary =
                                                                                                let
                                                                                                    identity =
                                                                                                        {
                                                                                                            count ? 2 ,
                                                                                                            expected ,
                                                                                                            test
                                                                                                        } :
                                                                                                            {
                                                                                                                count = if builtins.typeOf count == "int" then count else builtins.throw "count is not int but ${ builtins.typeOf count }." ;
                                                                                                                expected = if builtins.typeOf expected == "string" then expected else builtins.throw "expected is not string but ${ builtins.typeOf expected }." ;
                                                                                                                test = if builtins.typeOf test == "string" then test else builtins.throw "test is not string but ${ builtins.typeOf test }." ;
                                                                                                            } ;
                                                                                                    in identity ( value null ) ;
                                                                                            user-environment =
                                                                                                pkgs.buildFHSUserEnv
                                                                                                    {
                                                                                                        extraBwrapArgs =
                                                                                                            [
                                                                                                                "--bind ${ builtins.concatStringsSep "" [ "$" "{" "POST" "}" ] } /post"
                                                                                                            ] ;
                                                                                                        name = "test-candidate" ;
                                                                                                        runScript = script ;
                                                                                                        targetPkgs = pkgs : [ candidate ] ;
                                                                                                    } ;
                                                                                            in
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        [
                                                                                                            "${ pkgs.coreutils }/bin/cp --recursive --preserve=mode ${ secondary.expected } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "expected" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                            "export POST=$( ${ pkgs.coreutils }/bin/mktemp --directory )"
                                                                                                            "${ user-environment }/bin/test-candidate"
                                                                                                            "${ pkgs.coreutils }/bin/mv ${ builtins.concatStringsSep "" [ "$" "{" "POST" "}" ] } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "observed" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                            "${ pkgs.coreutils }/bin/ln --symbolic ${ script } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) ] ) }"
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
                                                        {
                                                            name = "resource" ;
                                                            value =  "--run 'export RESOURCE=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                        }
                                                        {
                                                            name = "target" ;
                                                            value =  "--run 'export TARGET=$( ${ pkgs.coreutils }/bin/dirname $( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } ) )'" ;
                                                        }
                                                    ] ;
                                                mounts =
                                                    {
                                                        "/temporary" = builtins.throw "This should not be used in production." ;
                                                        "/post" = builtins.throw "This should not be used in production." ;
                                                    } ;
                                                shell-scripts =
                                                    {
                                                        executable =
                                                            ignore :
                                                                {
                                                                    environment =
                                                                        { resource , self , path , standard-input , string , target } :
                                                                            [
                                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( self "FOOBAR" ( self : self.foobar ) )
                                                                                ( string "JQ" "${ pkgs.jq }/bin/jq" )
                                                                                ( path "NAME" 0 )
                                                                                ( resource )
                                                                                ( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
                                                                                ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                ( target )
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
                                                    host-path = "/tmp/y8NbY4kY" ;
                                                    init = scripts.executable ;
                                                    initializer = 66 ;
                                                    post = scripts.post ;
                                                    release = scripts.executable ;
                                                    standard-error = 67 ;
                                                    tests =
                                                        [
                                                            (
                                                                ignore :
                                                                    {
                                                                        count = 2 ;
                                                                        expected = self + "/mounts/" ;
                                                                        test = "${ pkgs.coreutils }/bin/echo 8315b9981bd91e569ab551632b4b06da8d1926e6f421b58c3d880c9ba648fc8edc1ea9fd62574836622de8bfabd59fa2ce92819c370a1c974dab9d84286cabff | candidate ff2d4ae2261b9c3cf783e38158bdbac15471ca106ca7d6070b9bd7683f0c2adad9304508051babb35bd0721237070c7657de06ff5a29b0b9572230546876f94a" ;
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
                                                                            ${ pkgs.coreutils }/bin/echo ${ temporary.util.shell-scripts.teardown-asynch } &&
                                                                            exit 62
                                                                    '' ;
                                                                name = "foobar" ;
                                                                src = ./. ;
                                                            } ;
                                                    shell-script = scripts.tests ;
                                                    util = temporary.util.tests ;
                                                    # temporary = temporary.tests ;
                                                } ;
                                            lib = lib ;
                                        } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}