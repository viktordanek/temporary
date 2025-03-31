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
                                                teardown =
                                                    _shell-script
                                                        {
                                                            extensions =
                                                                {
                                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                                } ;
                                                            mounts =
                                                                {
                                                                    "/flags/post" =
                                                                        {
                                                                            is-read-only = true ;
                                                                        } ;
                                                                    "/flags/release" =
                                                                        {
                                                                            is-read-only = true ;
                                                                        } ;
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
                                                                                "/flags/post" =
                                                                                    {
                                                                                        expected = self + "/expected/mounts/flags/post.down" ;
                                                                                        initial =
                                                                                            [
                                                                                                "touch /mount/target"
                                                                                            ] ;
                                                                                    } ;
                                                                                "/flags/release" =
                                                                                    {
                                                                                        expected = self + "/expected/mounts/flags/release.down" ;
                                                                                        initial =
                                                                                            [
                                                                                                "touch /mount/target"
                                                                                            ] ;
                                                                                    } ;
                                                                                "/mount" =
                                                                                    {
                                                                                        expected = self + "/expected/mounts/resource" ;
                                                                                        initial =
                                                                                            [
                                                                                                "mkdir /mount/target"
                                                                                                "touch /mount/target/resource"
                                                                                            ] ;
                                                                                    } ;
                                                                            } ;
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
                                        {
                                            foobar =
                                                pkgs.stdenv.mkDerivation
                                                    {
                                                        installPhase =
                                                            let
                                                                foobar = lib { post = post.shell-script ; } ;
                                                                post =
                                                                    _shell-script
                                                                        {
                                                                            extensions =
                                                                                {
                                                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                                                } ;
                                                                            mounts =
                                                                                {
                                                                                   "/flag" =
                                                                                        {
                                                                                            host-path = _environment-variable "POST_FLAG_FILE" ;
                                                                                            is-read-only = false ;
                                                                                       } ;
                                                                                } ;
                                                                            name = "flag" ;
                                                                            profile =
                                                                                { string } :
                                                                                    [
                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                        ( string "UUID" "3e5249f35257c22a56745efa3e0314aa6af4aa1fba26980de324ff1bae22475a81143bef69bc0316e67279ebd3cace490c4d43b9b0885fa73c7826d0edb60b0d" )
                                                                                    ] ;
                                                                            script = self + "/flag.sh" ;
                                                                            tests = null ;
                                                                        } ;
                                                                tests =
                                                                    let
                                                                        mapper =
                                                                            script :
                                                                                [
                                                                                    "${ pkgs.coreutils }/bin/echo ${ script.shell-script }"
                                                                                    "if [ -f ${ script.tests }/SUCCESS ] ; then ${ pkgs.coreutils }/bin/echo There was success at ${ script.tests }. ; elif [ -f ${ script.tests }/FAILURE ] ; then ${ pkgs.coreutils }/bin/echo There was predicted failure at ${ script.tests }. >&2 && exit 63 ; else ${ pkgs.coreutils }/bin/echo There was unpredicted failure at ${ script.tests } >&2 && exit 62 ; fi"
                                                                                ] ;
                                                                        scripts = [ foobar.scripts.teardown post ] ;
                                                                        in builtins.concatLists ( builtins.map mapper scripts ) ;
                                                                in
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/touch $out &&
                                                                            ${ builtins.concatStringsSep " &&\n\t" tests } &&
                                                                            exit 81
                                                                    '' ;
                                                        name = "foobar" ;
                                                        src = ./. ;
                                                    } ;
                                        } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}