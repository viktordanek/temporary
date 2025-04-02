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
                                            let
                                                enrich =
                                                    name : set :
                                                        if name == "init" && builtins.typeOf set == "null" then builtins.throw "${ name } is null not set."
                                                        else if builtins.typeOf set == "null" then set
                                                        else if builtins.typeOf set == "set" then
                                                            let
                                                                arguments-minus = builtins.removeAttrs set [ "mounts" "resource" "target" ] ;
                                                                arguments-plus = arguments-minus // { mounts = mounts ; } ;
                                                                eval = builtins.tryEval ( _shell-script arguments-plus ) ;
                                                                mounts =
                                                                    {
                                                                        "${ resource }" =
                                                                            {
                                                                                host-path = _environment-variable "RESOURCE" ;
                                                                                is-read-only = true ;
                                                                            } ;
                                                                        "${ target }" =
                                                                            {
                                                                                host-path = "${ _environment-variable "RESOURCE" }/mount/target" ;
                                                                                is-read-only = name != "init" ;
                                                                            } ;
                                                                    } ;
                                                                resource =
                                                                    if builtins.hasAttr "resource" set then builtins.getAttr "resource" set
                                                                    else "/resource" ;
                                                                target =
                                                                    if builtins.hasAttr "resource" set then builtins.getAttr "resource" set
                                                                    else "/target" ;
                                                                in if eval.success then eval.value else builtins.throw "There was a problem evaluating ${ name }."
                                                        else builtins.throw "${ name } is not null, set but ${ builtins.typeOf set }." ;
                                                in
                                                    {
                                                        init = enrich "init" init ;
                                                        lock-failure =
                                                            if builtins.typeOf lock-failure == "int" then builtins.toString lock-failure
                                                            else builtins.throw "lock-failure is not int but ${ builtins.typeOf lock-failure }." ;
                                                        post = enrich "post" post ;
                                                        release = enrich "release" release ;
                                                    } ;
                                        scripts =
                                            {
                                                init = primary.init ;
                                                post = primary.post ;
                                                release = primary.release ;
                                                setup =
                                                    _shell-script
                                                        {
                                                            extensions =
                                                                {
                                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                                } ;
                                                            name = "setup" ;
                                                            profile =
                                                                { string } :
                                                                    builtins.concatLists
                                                                        [
                                                                            [
                                                                                ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( string "HAS_STANDARD_INPUT" "WTF" )
                                                                                ( string "FIND" "${ pkgs.coreutils }/bin/find" )
                                                                                ( string "INIT" init )
                                                                                ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
                                                                                ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                ( string "STANDARD_INPUT" "WTF" )
                                                                                ( string "UNINITIALIZED_TARGET_ERROR_CODE" primary.uninitialized-target-error-code )
                                                                                ( string "UNINITIALIZED_TARGET_ERROR_MESSAGE" primary.uninitialized-target-error-message )
                                                                                ( string "OVER_INITIALIZED_TARGET_ERROR_CODE" primary.over-initialized-target-error-code )
                                                                                ( string "OVER_INITIALIZED_TARGET_ERROR_MESSAGE" primary.over-initialized-target-error-message )

                                                                            ]
                                                                        ] ;
                                                            script =
                                                                let
                                                                    all = builtins.filter ( x : builtins.typeOf x == "string" ) ( builtins.split "\n" ( builtins.readFile ( builtins.toString ( self + "/setup.sh" ) ) ) ) ;
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
                                                                    # in builtins.toFile "teardown" ( builtins.concatStringsSep "\n" simplified ) ;
                                                                    in self + "/setup.sh" ;
                                                            tests =
                                                                ignore :
                                                                    {
                                                                        status = 103 ;
                                                                        test =
                                                                            [
                                                                                "CANDIDATE+$( candidate )"
                                                                                "echo ${ _environment-variable "CANDIDATE" }"
                                                                                "echo 100"
                                                                                "exit 101"
                                                                            ] ;
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
                                                                                ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                ( string "PID" 9999 )
                                                                            ]
                                                                            ( if builtins.typeOf primary.post == "null" then [ ] else [ ( string "POST" primary.post ) ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ ( string "RELEASE" primary.release ) ] )
                                                                            [
                                                                                ( string "RESOURCE" "$( ${ _environment-variable "MKTEMP" } )" )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                                ( string "TARGET" "$( ${ _environment-variable "MKTEMP" } )" )
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
                                                                                ( if builtins.typeOf primary.post == "null" then [ ] else [ 13 ] )
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
                                                                                                "mkdir --parents /mount/target/resource"
                                                                                                "echo a60aa448919abcb69f7804ee9f3879fc9bd06765172f6c86cc697cc217719ae46278551a687cd80cc5a7d2c22ba2d79fccee95905ebb2865da1609da90d491c1 > /mount/target/resource/target"
                                                                                            ] ;
                                                                                    } ;
                                                                            } ;
                                                                        standard-output = self + "/expected/teardown/standard-output-${ if builtins.typeOf primary.release == "null" then "0" else "1" }-${ if builtins.typeOf primary.post == "null" then "0" else "1" }" ;
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
                                                {
                                                    extensions =
                                                        {
                                                            string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                        } ;
                                                    name = "init" ;
                                                    profile =
                                                        { string } :
                                                            [
                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                            ] ;
                                                    script = self + "/flag.sh" ;
                                                    tests =
                                                        ignore :
                                                            {
                                                                mounts =
                                                                    {
                                                                        "/resource" =
                                                                            {
                                                                                expected = self + "/expected/init/mounts/resource" ;
                                                                                initial =
                                                                                    [
                                                                                        "echo 4806851f94f416164d4f20028664c37e592579ebed9be9976f55045699f35cd5ef3335775e1f774e0803ba3a1fee5a67aba1be7f1005fa9aec5bbd952dac207e > /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                        "/target" =
                                                                            {
                                                                                expected = self + "/expected/init/mounts/target" ;
                                                                                initial =
                                                                                    [
                                                                                        "echo 089cd1f177d042495e7f0975e861bf91e98234139e802769d85df406e70e8bd0fad9b68a557a56cddcbbbea10bc4e92095a77d190fc508c34bb715c910c2d804 > /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                    } ;
                                                                standard-output = self + "/expected/init/standard-output" ;
                                                            } ;
                                                } ;
                                            list =
                                                let
                                                    foobar =
                                                        name : temporary : attribute : success :
                                                            {
                                                                name = builtins.toJSON { name = name ; attribute = attribute ; } ;
                                                                value =
                                                                    pkgs.stdenv.mkDerivation
                                                                        {
                                                                            installPhase =
                                                                                let
                                                                                    candidate = builtins.getAttr attribute temporary.scripts ;
                                                                                    success-code = if success then "0" else "61" ;
                                                                                    in
                                                                                        if builtins.typeOf candidate == "null"
                                                                                        then
                                                                                            ''
                                                                                                ${ pkgs.coreutils }/bin/touch $out &&
                                                                                                    ${ pkgs.coreutils }/bin/echo NAME=${ name } &&
                                                                                                    ${ pkgs.coreutils }/bin/echo ATTRIBUTE=${ attribute } &&
                                                                                                    ${ pkgs.coreutils }/bin/echo SUCCESS_CODE=${ success-code } &&
                                                                                                    ${ pkgs.coreutils }/bin/echo because the candidate is null the check passes trivially. &&
                                                                                                    exit ${ success-code }
                                                                                            ''
                                                                                        else
                                                                                            ''
                                                                                                ${ pkgs.coreutils }/bin/touch $out &&
                                                                                                    ${ pkgs.coreutils }/bin/echo NAME=${ name } &&
                                                                                                    ${ pkgs.coreutils }/bin/echo ATTRIBUTE=${ attribute } &&
                                                                                                    ${ pkgs.coreutils }/bin/echo SUCCESS_CODE=${ success-code } &&
                                                                                                    if [ -f ${ candidate.tests }/SUCCESS ]
                                                                                                    then
                                                                                                        ${ pkgs.coreutils }/bin/echo There was success in ${ candidate.tests }.
                                                                                                    elif [ -f ${ candidate.tests }/FAILURE ]
                                                                                                    then
                                                                                                        ${ pkgs.coreutils }/bin/echo There was failure in ${ candidate.tests }. >&2 &&
                                                                                                            exit 63
                                                                                                    else
                                                                                                        ${ pkgs.coreutils }/bin/echo There was error in ${ candidate.tests }. >&2 &&
                                                                                                            exit 62
                                                                                                    fi &&
                                                                                                    exit ${ success-code }
                                                                                            '' ;
                                                                            name = name ;
                                                                            src = ./. ;
                                                                        } ;
                                                                } ;
                                                    in
                                                        [
                                                            ( foobar "0-0" ( lib { init = init ; } ) "init" true )
                                                            ( foobar "0-0" ( lib { init = init ; } ) "post" true )
                                                            ( foobar "0-0" ( lib { init = init ; } ) "release" true )
                                                            ( foobar "0-0" ( lib { init = init ; } ) "teardown" true )
                                                        ] ;
                                            post =
                                                {
                                                    extensions =
                                                        {
                                                            string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                        } ;
                                                    name = "post" ;
                                                    profile =
                                                        { string } :
                                                            [
                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                            ] ;
                                                    script = self + "/flag.sh" ;
                                                    tests =
                                                        ignore :
                                                            {
                                                                mounts =
                                                                    {
                                                                        "/resource" =
                                                                            {
                                                                                expected = self + "/expected/post/mounts/resource" ;
                                                                                initial =
                                                                                    [
                                                                                        "echo c019fafab6f1d19b6266c357f4fa9ba6e6c88ef21e6f02a7777c2a94afec6608660f8252393648307b81da9d1a74552fbcaff38444bf42925a3001504fa5a65d > /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                        "/target" =
                                                                            {
                                                                                expected = self + "/expected/post/mounts/target" ;
                                                                                initial =
                                                                                    [
                                                                                        "echo aa4b0468d9b5bc33422777fcb8892f76073a60fc9cd2f6089ca9dbe12336c89861e9b6149832ed99b30be163177d0c3b561554bef3ba9eebb8da96a22838b08e > /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                    } ;
                                                                standard-output = self + "/expected/post/standard-output" ;
                                                            } ;
                                                } ;
                                            release =
                                                {
                                                    extensions =
                                                        {
                                                            string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                        } ;
                                                    name = "release" ;
                                                    mounts =
                                                        {
                                                            "/resource" =
                                                                {
                                                                    host-path = _environment-variable "RESOURCE" ;
                                                                    is-read-only = true ;
                                                                } ;
                                                            "/target" =
                                                                {
                                                                    host-path = _environment-variable "TARGET" ;
                                                                    is-read-only = true ;
                                                                } ;
                                                        } ;
                                                    profile =
                                                        { string } :
                                                            [
                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                            ] ;
                                                    script = self + "/flag.sh" ;
                                                    tests =
                                                        ignore :
                                                            {
                                                                mounts =
                                                                    {
                                                                        "/resource" =
                                                                            {
                                                                                expected = self + "/expected/release/mounts/resource" ;
                                                                                initial =
                                                                                    [
                                                                                        "echo 230ad29bc6c9ba25fb5afe5d79640fd2eeddd526483d1f5e844490e697d6917b4804a4f6d0eea656405a23f437071ad95c1cd71f2f62fe7a844f8cd216543750 > /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                        "/target" =
                                                                            {
                                                                                expected = self + "/expected/release/mounts/target" ;
                                                                                initial =
                                                                                    [
                                                                                        "echo fd20a7c74b6a58415e1ae2816cdfbc56ffbd19f0db2a4e4bd2ff772c8975743c42493e673122e3638fa37de04bc2b34da56eb55bc4b154b1e73431f46b9d43e1 > /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                    } ;
                                                                standard-output = self + "/expected/release/standard-output" ;
                                                            } ;
                                                } ;
                                            in builtins.listToAttrs ( list ) ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}