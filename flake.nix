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
                                    initializer ? 64 ,
                                    standard-error ? 65 ,
                                    temporary ? null ,
                                } :
                                    let
                                        derivation =
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
                                                                                    point =
                                                                                        let
                                                                                            identity =
                                                                                                {
                                                                                                    init ? null ,
                                                                                                    release ? null ,
                                                                                                    post ? null ,
                                                                                                    tests ? null
                                                                                                } :
                                                                                                    {
                                                                                                        init = init ;
                                                                                                        release = release ;
                                                                                                        post = post ;
                                                                                                        tests = tests ;
                                                                                                    } ;
                                                                                            in identity ( value null ) ;
                                                                                    setup =
                                                                                        let
                                                                                            reducer = previous : current : builtins.getAttr ( if builtins.typeOf current == "lambda" then "true" else "false" ) previous ;
                                                                                            in builtins.foldl' reducer [ point.init point.release point.post ] util.setup ;
                                                                                    in
                                                                                        [
                                                                                            "makeWrapper ${ setup } $out"
                                                                                        ] ;
                                                                    }
                                                                    {
                                                                        list =
                                                                            path : list :
                                                                                builtins.concatLists
                                                                                    [
                                                                                        [
                                                                                            "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                        ]
                                                                                        ( builtins.concatLists list )
                                                                                    ] ;
                                                                        set =
                                                                            path : set :
                                                                                builtins.concatLists
                                                                                    [
                                                                                        [
                                                                                            "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                        ]
                                                                                        ( builtins.concatLists ( builtins.attrValues set ) )
                                                                                    ] ;
                                                                    }
                                                                    primary.temporary ;
                                                            name = "derivation" ;
                                                            src = ./. ;
                                                            in builtins.concatStringsSep " &&\n\t" constructors ;
                                                } ;
                                        fun =
                                            init : release : post : target :
                                                in null ;
                                        mounts =
                                            {
                                                "/temporary" = primary.host-path ;
                                            } ;
                                        primary =
                                            {
                                                at = if builtins.typeOf at == "string" then at else builtins.throw "at is not string but ${ builtins.typeOf at }." ;
                                                host-path = if builtins.typeOf host-path == "string" then host-path else builtins.throw "host-path is not string but ${ builtins.typeOf host-path }." ;
                                                initializer = if builtins.typeOf initializer == "int" then initializer else builtins.throw "initializer is not int but ${ builtins.typeOf initializer }." ;
                                                standard-error = if builtins.typeOf standard-error == "int" then standard-error else builtins.throw "standard-error is not int but ${ builtins.typeOf standard-error }." ;
                                                temporary =
                                                    if builtins.typeOf temporary == "lambda" then temporary
                                                    else if builtins.typeOf temporary == "list" then temporary
                                                    else if builtins.typeOf temporary == "null" then temporary
                                                    else if builtins.typeOf temporary == "set" then temporary
                                                    else builtins.throw "temporary is not lambda, list, null, set but ${ builtins.typeOf temporary }." ;
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
                                                                value =  name : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
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
                                                                                    builtins.map ( s : if builtins.elemAt s 0 then [ "${ builtins.elemAt s 1 },${ builtins.elemAt s 2 }p" ] else [ ] ) splits
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
                                                                                                        ( if init then [ ( string "MAKE_WRAPPER_INIT" "makeWrapper ${ init } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/init.sh" ) ] else [ ] )
                                                                                                        ( if post then [ ( string "MAKE_WRAPPER_POST" "makeWrapper ${ post } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/post.sh" ) ] else [ ] )
                                                                                                        ( if release then [ ( string "MAKE_WRAPPER_RELEASE" "makeWrapper ${ release } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/release.sh" ) ] else [ ] )
                                                                                                        [
                                                                                                            ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                                            ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                                            ( self "TEARDOWN_ASYNCH" ( self : self.teardown-asynch ) )
                                                                                                            ( self "TEARDOWN_SYNCH" ( self : self.teardown-synch.${ release }.${ post } ) )
                                                                                                            ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                                                        ]
                                                                                                    ] ;
                                                                                        script =
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
                                                                                            ( resource "RESOURCE" )
                                                                                        ] ;
                                                                                script =
                                                                                    pkgs.stdenv.mkDerivation
                                                                                        {
                                                                                            installPhase =
                                                                                                ''
                                                                                                    ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/teardown-asynch.sh" } > $out &&
                                                                                                        ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                                                '' ;
                                                                                            name = "teardown-asynch" ;
                                                                                            src = ./. ;
                                                                                        } ;
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
                                                temporary =
                                                    _visitor
                                                        {
                                                            lambda = path : value : builtins.concatStringsSep "/" ( builtins.concatLists [ [ derivation ] ( builtins.map builtins.toJSON path ) ] ) ;
                                                        }
                                                        { }
                                                        primary.temporary ;
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
                                                                                                            ''
                                                                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                                                    ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                                                                    ${ pkgs.coreutils }/bin/ln --symbolic ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ derivation ] ( builtins.map builtins.toJSON path ) ] ) } $out/bin/candidate
                                                                                                            '' ;
                                                                                                    } ;
                                                                                                    expected = builtins.concatLists [ [ "$out" "expected" ] ( builtins.map builtins.toJSON path ) ] ;
                                                                                                    observed = builtins.concatLists [ [ "$out" "observed" ] ( builtins.map builtins.toJSON path ) ] ;
                                                                                                    tests = builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) ] ;
                                                                                                    point = value null ;
                                                                                                    in
                                                                                                        _visitor
                                                                                                            {
                                                                                                                lambda =
                                                                                                                    path : value :
                                                                                                                        let
                                                                                                                            secondary =
                                                                                                                                let
                                                                                                                                    identity =
                                                                                                                                        {
                                                                                                                                            error ? "" ,
                                                                                                                                            mounts ? { } ,
                                                                                                                                            output ? "" ,
                                                                                                                                            status ? 0 ,
                                                                                                                                            test
                                                                                                                                        } :
                                                                                                                                            {
                                                                                                                                                test = test ;
                                                                                                                                            } ;
                                                                                                                                    in identity ( value null ) ;
                                                                                                                            user-environment =
                                                                                                                                pkgs.buildFHSUserEnv
                                                                                                                                    {
                                                                                                                                        extraBrwapArgs = null ;
                                                                                                                                        name = "test-candidate" ;
                                                                                                                                        runScript = pkgs.writeShellScript "test" secondary.test ;
                                                                                                                                        targetPkgs = pkgs : [ candidate ] ;
                                                                                                                                    } ;
                                                                                                                            in
                                                                                                                                builtins.concatLists
                                                                                                                                    [
                                                                                                                                        [
                                                                                                                                            "${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "test" secondary.test } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ tests ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                                                        ]
                                                                                                                                    ] ;
                                                                                                            }
                                                                                                            {
                                                                                                                list =
                                                                                                                    path : list :
                                                                                                                        builtins.concatLists
                                                                                                                            [
                                                                                                                                [
                                                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ expected ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ observed ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ tests ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                                                ]
                                                                                                                                ( builtins.concatLists list )
                                                                                                                            ] ;
                                                                                                                set =
                                                                                                                    path : set :
                                                                                                                        builtins.concatLists
                                                                                                                            [
                                                                                                                                [
                                                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ expected ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ observed ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ tests ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                                                ]
                                                                                                                                ( builtins.concatLists ( builtins.attrValues set ) )
                                                                                                                            ] ;
                                                                                                            }
                                                                                                            point.tests ;
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
                                                                                                ( builtins.concatLists ( builtins.attrValues set ) )
                                                                                            ] ;
                                                                            }
                                                                            primary.temporary ;
                                                                    in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ [ "${ pkgs.coreutils }/bin/mkdir $out" ] constructors ] ) ;
                                                            name = "tests" ;
                                                            src = ./. ;
                                                        } ;
                                                util = util ;
                                            } ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks =
                                        {
                                            shell-script =
                                                let
                                                    shell-script =
                                                        _shell-script
                                                            {
                                                                mounts = { "/temporary" = builtins.throw "This should not be used in production." ; } ;
                                                                shell-scripts =
                                                                    {
                                                                        foobar =
                                                                            ignore :
                                                                                {
                                                                                    environment =
                                                                                        { path , self , standard-input , string } :
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
                                                                    } ;
                                                            } ;
                                                    in shell-script.tests ;
                                            temporary =
                                                let
                                                    temporary =
                                                        lib
                                                            {
                                                                at = "/run/wrappers/bin/at" ;
                                                                host-path = builtins.throw "DO NOT USE ME IN PRODUCTION" ;
                                                                initializer = 66 ;
                                                                standard-error = 67 ;
                                                                temporary =
                                                                    {
                                                                        foobar =
                                                                            ignore :
                                                                                {
                                                                                    init =
                                                                                        ignore :
                                                                                            {
                                                                                                environment =
                                                                                                    { path , self , standard-input , string } :
                                                                                                        [
                                                                                                        ] ;
                                                                                                script = self + "/scripts/init.sh" ;
                                                                                            } ;
                                                                                    tests =
                                                                                        [
                                                                                            (
                                                                                                ignore :
                                                                                                    {
                                                                                                        test = "candidate" ;
                                                                                                    }
                                                                                            )
                                                                                        ] ;
                                                                                } ;
                                                                    } ;
                                                            } ;
                                                    in pkgs.stdenv.mkDerivation { installPhase = "${ pkgs.coreutils }/bin/touch $out && ${ pkgs.coreutils }/bin/echo ${ temporary.tests } && exit 63" ; name = "NAME" ; src = ./. ; } ;
                                        } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}