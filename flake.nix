{
    inputs =
        {
            environment-variable.url = "github:/viktordanek/environment-variable" ;
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
            shell-script.url = "github:viktordanek/shell-script/scratch/0d2e6138-6c74-4217-8e36-65f0ad07d7de" ;
            visitor.url = "github:viktordanek/visitor" ;
        } ;
    outputs =
        { environment-variable , flake-utils , nixpkgs , self , shell-script , visitor } :
            let
                fun =
                    system :
                        let
                            _environment-variable = builtins.getAttr system environment-variable.lib ;
                            _shell-script = builtins.getAttr system shell-script.lib ;
                            lib =
                                {
                                    host-path ? "\${TMP_DIR}" ,
                                    init ? null ,
                                    lock-failure ? 64 ,
                                    post ? null ,
                                    release ? null ,
                                    shell-scripts ? { } ,
                                    tests ? null
                                } :
                                    let
                                        primary =
                                            {
                                                lock-failure =
                                                    if builtins.typeOf lock-failure == "int" then builtins.toString lock-failure
                                                    else builtins.throw "lock-failure is not int but ${ builtins.typeOf lock-failure }." ;
                                                post =
                                                    if builtins.typeOf post == "null" then post
                                                    else if builtins.typeOf post == "string" then post
                                                    else builtins.throw "post is not null, string but ${ builtins.typeOf post }." ;
                                                release =
                                                    if builtins.typeOf release == "null" then release
                                                    else if builtins.typeOf release == "string" then release
                                                    else builtins.throw "release is not null, string but ${ builtins.typeOf release }." ;
                                            } ;
                                        scripts =
                                            {
                                                setup =
                                                    _shell-script
                                                        {
                                                            extensions =
                                                                {
                                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                                } ;
                                                            mounts =
                                                                {
                                                                    "/mount" =
                                                                        {
                                                                            is-read-only = false ;
                                                                        } ;
                                                                } ;
                                                            name = "setup" ;
                                                            profile =
                                                                { string } :
                                                                    [
                                                                    ] ;
                                                            script =
                                                                let
                                                                    all = builtins.filter ( x : builtins.typeOf x == "string" ) ( builtins.split "\n" ( builtins.readFile ( builtins.toString ( self + "/teardown.sh" ) ) ) ) ;
                                                                    array =
                                                                        builtins.concatLists
                                                                            [
                                                                                [ 0 ]
                                                                                [ 1 ]
                                                                                [ 2 ]
                                                                                [ 3 ]
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 5 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 6 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 7 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 8 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 9 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 10 ] )
                                                                                ( if builtins.typeOf primary.post == "null" then [ ] else [ 14 ] )
                                                                                [ 15 ]
                                                                                [ 16 ]
                                                                                [ 17 ]
                                                                                [ 18 ]
                                                                                [ 19 ]
                                                                            ] ;
                                                                    with-index = builtins.genList ( index : { index = index ; line = builtins.elemAt all index ; } ) ( builtins.length all ) ;
                                                                    filtered = builtins.filter ( x : builtins.any ( i : x.index == i ) array ) with-index ;
                                                                    simplified = builtins.map ( x : x.line ) filtered ;
                                                                    in builtins.toFile "teardown" ( builtins.concatStringsSep "\n" simplified ) ;
                                                            tests =
                                                                ignore :
                                                                    {

                                                                    } ;
                                                        } ;
                                                teardown =
                                                    _shell-script
                                                        {
                                                            extensions =
                                                                {
                                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                                } ;
                                                            mounts =
                                                                {
                                                                    "/mount" =
                                                                        {
                                                                            is-read-only = false ;
                                                                        } ;
                                                                } ;
                                                            name = "teardown" ;
                                                            profile =
                                                                { string } :
                                                                    builtins.concatLists
                                                                        [
                                                                            [
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                ( string "LOCK_FAILURE" primary.lock-failure )
                                                                                ( string "PID" 9999 )
                                                                            ]
                                                                            ( if builtins.typeOf primary.post == "null" then [ ] else [ ( string "POST" primary.post ) ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ ( string "RELEASE" primary.release ) ] )
                                                                            [
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                                ( string "TRUE" "${ pkgs.coreutils }/bin/true" )
                                                                            ]
                                                                        ] ;
                                                            script =
                                                                let
                                                                    all = builtins.filter ( x : builtins.typeOf x == "string" ) ( builtins.split "\n" ( builtins.readFile ( builtins.toString ( self + "/teardown.sh" ) ) ) ) ;
                                                                    array =
                                                                        builtins.concatLists
                                                                            [
                                                                                [ 0 ]
                                                                                [ 1 ]
                                                                                [ 2 ]
                                                                                [ 3 ]
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 5 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 6 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 7 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 8 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 9 ] )
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ 10 ] )
                                                                                ( if builtins.typeOf primary.post == "null" then [ ] else [ 14 ] )
                                                                                [ 15 ]
                                                                                [ 16 ]
                                                                                [ 17 ]
                                                                                [ 18 ]
                                                                                [ 19 ]
                                                                            ] ;
                                                                    with-index = builtins.genList ( index : { index = index ; line = builtins.elemAt all index ; } ) ( builtins.length all ) ;
                                                                    filtered = builtins.filter ( x : builtins.any ( i : x.index == i ) array ) with-index ;
                                                                    simplified = builtins.map ( x : x.line ) filtered ;
                                                                    in builtins.toFile "teardown" ( builtins.concatStringsSep "\n" simplified ) ;
                                                            tests =
                                                                ignore :
                                                                    {
                                                                        mounts =
                                                                            {
                                                                                "/mount" =
                                                                                    {
                                                                                        expected = self + "/expected/teardown/mounts/resource" ;
                                                                                        initial =
                                                                                            [
                                                                                                "mkdir /mount/target"
                                                                                                "echo bf1016292448b486870e23c6023fd44091f9fda04c5153b2f59e35de2edf9bf7707bba1f08b53223b2d10247014cf6e2fc920f5beb23eed6dad36bb777978308 > /mount/target/resource"
                                                                                            ] ;
                                                                                    } ;
                                                                            } ;
                                                                        standard-output = self + "/expected/teardown/standard-output-${ if builtins.typeOf primary.release == "null" then "false" else "true" }-${ if builtins.typeOf primary.post == "null" then "false" else "true" }" ;
                                                                    } ;
                                                        } ;
                                            } ;
                                        in
                                            {
                                                scripts = scripts ;
                                            } ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks =
                                        let
                                            init =
                                                _shell-script
                                                    {
                                                        extensions =
                                                            {
                                                                string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                            } ;
                                                        name = "flag" ;
                                                        profile =
                                                            { string } :
                                                                [
                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                    ( string "UUID" "3493629e1bbb07cd22b4554cb8557e9a9b30d71cf0e292f182fc522aca04042396c7c21a4d5cbcc8ac4061bc20f433c6a70af81d93a39b50ad34dc8e00ce3ac8" )
                                                                ] ;
                                                        script = self + "/flag.sh" ;
                                                        tests =
                                                            ignore :
                                                                {
                                                                    standard-output = self + "/expected/init/standard-output" ;
                                                                } ;
                                                    } ;
                                            list =
                                                let
                                                    foobar =
                                                        name : script : success :
                                                            {
                                                                name = name ;
                                                                value =
                                                                    pkgs.stdenv.mkDerivation
                                                                        {
                                                                            installPhase =
                                                                                let
                                                                                    shell-script = script.shell-script ;
                                                                                    tests = script.tests ;
                                                                                    success-code = if success then "0" else "61" ;
                                                                                    in
                                                                                        ''
                                                                                            ${ pkgs.coreutils }/bin/touch $out &&
                                                                                                ${ pkgs.coreutils }/bin/echo ${ name } &&
                                                                                                ${ pkgs.coreutils }/bin/echo ${ shell-script } &&
                                                                                                if [ -f ${ tests }/SUCCESS ]
                                                                                                then
                                                                                                    ${ pkgs.coreutils }/bin/echo There was success in ${ tests }. &&
                                                                                                        exit ${ success-code }
                                                                                                elif [ -f ${ tests }/FAILURE ]
                                                                                                then
                                                                                                    ${ pkgs.coreutils }/bin/echo There was failure in ${ tests }. >&2 &&
                                                                                                        exit 63
                                                                                                else
                                                                                                    ${ pkgs.coreutils }/bin/echo There was error in ${ tests }. >&2 &&
                                                                                                        exit 62
                                                                                                fi
                                                                                        '' ;
                                                                            name = name ;
                                                                            src = ./. ;
                                                                        } ;
                                                                } ;
                                                    in
                                                        [
                                                            ( foobar "init" init true )
                                                            ( foobar "post" post true )
                                                            ( foobar "release" release true )
                                                        ] ;
                                            post =
                                                _shell-script
                                                    {
                                                        extensions =
                                                            {
                                                                string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                            } ;
                                                        name = "flag" ;
                                                        profile =
                                                            { string } :
                                                                [
                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                    ( string "UUID" "62279656383ea24097dba41e855b8639e142bbefcb33753cd55e2249086aed5c51c83775e49ccd8850f9e5e7e77b28778842aea3e4e6d87c511d076d1d4c995e" )
                                                                ] ;
                                                        script = self + "/flag.sh" ;
                                                        tests =
                                                            ignore :
                                                                {
                                                                    standard-output = self + "/expected/post/standard-output" ;
                                                                } ;
                                                    } ;
                                            release =
                                                _shell-script
                                                    {
                                                        extensions =
                                                            {
                                                                string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                            } ;
                                                        name = "flag" ;
                                                        profile =
                                                            { string } :
                                                                [
                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                    ( string "UUID" "29f2dc4be20c9ebdba7bf0bc3c0bff66d7e758753100523c49e4a7ff88b7b3bb67b8e821cab126eeb9789aa5ab168dfc89f7962fa578ffdc722fe36476166383" )
                                                                ] ;
                                                        script = self + "/flag.sh" ;
                                                        tests =
                                                            ignore :
                                                                {
                                                                    standard-output = self + "/expected/release/standard-output" ;
                                                                } ;
                                                    } ;
                                            in builtins.listToAttrs ( list ) ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}