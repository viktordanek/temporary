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
                            _visitor = builtins.getAttr system visitor.lib ;
                            lib =
                                {
                                    host-path ? "\${TMP_DIR}" ,
                                    init ? null ,
                                    initialization-error-code ? 66 ,
                                    lock-failure ? 64 ,
                                    post ? null ,
                                    release ? null ,
                                    shell-scripts ? { } ,
                                    tests ? null ,
                                    uninitialized-target-error-code ? 65 ,
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
                                                                                host-path = _environment-variable ( if name == "init" then "TARGET_MOUNT" else "TARGET" ) ;
                                                                                is-read-only = name != "init" ;
                                                                            } ;
                                                                    } ;
                                                                resource =
                                                                    if builtins.hasAttr "resource" set then builtins.getAttr "resource" set
                                                                    else "/resource" ;
                                                                target =
                                                                    if builtins.hasAttr "target" set then builtins.getAttr "target" set
                                                                    else if name == "init" then "/mount"
                                                                    else "/target" ;
                                                                in if eval.success then eval.value else builtins.throw "There was a problem evaluating ${ name }."
                                                        else builtins.throw "${ name } is not null, set but ${ builtins.typeOf set }." ;
                                                in
                                                    {
                                                        init = enrich "init" init ;
                                                        initialization-error-code =
                                                            if builtins.typeOf initialization-error-code == "int" then builtins.toString initialization-error-code
                                                            else builtins.throw "initialization-error-code is not int but ${ builtins.typeOf initialization-error-code }." ;
                                                        lock-failure =
                                                            if builtins.typeOf lock-failure == "int" then builtins.toString lock-failure
                                                            else builtins.throw "lock-failure is not int but ${ builtins.typeOf lock-failure }." ;
                                                        post = enrich "post" post ;
                                                        release = enrich "release" release ;
                                                        tests =
                                                            _visitor
                                                                {
                                                                    lambda =
                                                                        path : value : ignore :
                                                                            let
                                                                                secondary =
                                                                                    let
                                                                                        identity =
                                                                                            {
                                                                                                arguments ? null ,
                                                                                                file ? null ,
                                                                                                paste ? null ,
                                                                                                pipe ? null ,
                                                                                                status ? 0 ,
                                                                                                vacuum ? "TBD"
                                                                                            } :
                                                                                                {
                                                                                                    arguments =
                                                                                                        if builtins.typeOf arguments == "list" then builtins.map ( value : if builtins.typeOf value == "string" then value else builtins.throw "argument is not string but ${ builtins.typeOf value }." ) arguments
                                                                                                        else if builtins.typeOf arguments == "null" then [ ]
                                                                                                        else if builtins.typeOf arguments == "string" then [ arguments ]
                                                                                                        else builtins.throw "arguments is not list, null, string but ${ builtins.typeOf arguments }." ;
                                                                                                    file =
                                                                                                        if builtins.typeOf file == "null" then [ ]
                                                                                                        else if builtins.typeOf file == "string" then [ "< ${ builtins.toFile "file" file }" ]
                                                                                                        else builtins.throw "file is not null, string but ${ builtins.typeOf file }." ;
                                                                                                    paste =
                                                                                                        if builtins.typeOf paste == "null" then ""
                                                                                                        else if builtins.typeOf paste == "string" then paste
                                                                                                        else builtins.throw "arguments is not null, string but ${ builtins.typeOf paste }." ;
                                                                                                    pipe =
                                                                                                        if builtins.typeOf pipe == "null" then [ ]
                                                                                                        else if builtins.typeOf pipe == "string" then [ "cat ${ builtins.toFile "pipe" pipe } |" ]
                                                                                                        else builtins.throw "pipe is not null, string but ${ builtins.typeOf pipe }." ;
                                                                                                    status =
                                                                                                        if builtins.typeOf status == "int" then status
                                                                                                        else builtins.throw "status is not int but ${ builtins.typeOf status }." ;
                                                                                                    vacuum =
                                                                                                        if builtins.typeOf vacuum == "string" then vacuum
                                                                                                        else builtins.throw "vacuum is not string but ${ builtins.typeOf vacuum }." ;
                                                                                                } ;
                                                                                        in identity ( value null ) ;
                                                                                in
                                                                                    {
                                                                                        status = secondary.status ;
                                                                                        test =
                                                                                            builtins.toString
                                                                                                (
                                                                                                    pkgs.writeShellScript
                                                                                                        "script"
                                                                                                        (
                                                                                                            if secondary.status == 0 then
                                                                                                                ''
                                                                                                                    CANDIDATE=$( ${ builtins.concatStringsSep " " ( builtins.concatLists [ secondary.pipe [ "candidate" ] secondary.arguments secondary.file ] ) } )
                                                                                                                ''
                                                                                                            else
                                                                                                                ''
                                                                                                                    CANDIDATE=$( ${ builtins.concatStringsSep " " ( builtins.concatLists [ secondary.pipe [ "candidate" ] secondary.arguments secondary.file ] ) } ) &&
                                                                                                                        echo ${ _environment-variable "CANDIDATE" } &&
                                                                                                                        exit ${ _environment-variable "?" }
                                                                                                                ''
                                                                                                        )
                                                                                                ) ;
                                                                                    } ;
                                                                    null = path : value : null ;
                                                                }
                                                                { }
                                                                tests ;
                                                        uninitialized-target-error-code =
                                                            if builtins.typeOf uninitialized-target-error-code == "int" then builtins.toString uninitialized-target-error-code
                                                            else builtins.throw "uninitialized-target-error-code is not int but ${ builtins.typeOf uninitialized-target-error-code }." ;
                                                    } ;
                                        setup =
                                            _shell-script
                                                {
                                                    extensions =
                                                        {
                                                            has-standard-input = name : "export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/false ; fi )" ;
                                                            standard-input = name : "export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )" ;
                                                            string = name : value : "export ${ name }=\"${ builtins.toString value }\"" ;
                                                        } ;
                                                    name = "setup" ;
                                                    profile =
                                                        { has-standard-input , standard-input , string } :
                                                            builtins.concatLists
                                                                [
                                                                    [
                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                        ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                        ( has-standard-input "HAS_STANDARD_INPUT" )
                                                                        ( string "INIT" primary.init.shell-script )
                                                                        ( string "INITIALIZATION_ERROR_CODE" primary.initialization-error-code )
                                                                        ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
                                                                        ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                        ( standard-input "STANDARD_INPUT" )
                                                                        ( string "UNINITIALIZED_TARGET_ERROR_CODE" primary.uninitialized-target-error-code )
                                                                    ]
                                                                ] ;
                                                    script = self + "/setup.sh" ;
                                                    tests = primary.tests ;
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
                                                                    ( if builtins.typeOf primary.post == "null" then [ ] else [ ( string "POST" primary.post.shell-script ) ] )
                                                                    ( if builtins.typeOf primary.release == "null" then [ ] else [ ( string "RELEASE" primary.release.shell-script ) ] )
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
                                        in
                                            {
                                                tests =
                                                    pkgs.stdenv.mkDerivation
                                                        {
                                                            installPhase =
                                                                let
                                                                    constructors =
                                                                        builtins.concatLists
                                                                            [
                                                                                [
                                                                                    "${ _environment-variable "MKDIR" } ${ _environment-variable "OUT" }/units"
                                                                                    "${ _environment-variable "LN" } --symbolic ${ primary.init.tests } ${ _environment-variable "OUT" }/units/init"
                                                                                ]
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ "${ _environment-variable "LN" } --symbolic ${ primary.release.tests } ${ _environment-variable "OUT" }/units/release" ] )
                                                                                ( if builtins.typeOf primary.post == "null" then [ ] else [ "${ _environment-variable "LN" } --symbolic ${ primary.post.tests } ${ _environment-variable "OUT" }/units/post" ] )
                                                                                [
                                                                                    "${ _environment-variable "LN" } --symbolic ${ teardown.tests } ${ _environment-variable "OUT" }/units/teardown"
                                                                                    "${ _environment-variable "LN" } --symbolic ${ setup.tests } ${ _environment-variable "OUT" }/units/setup"
                                                                                ]
                                                                            ] ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                ${ pkgs.coreutils }/bin/mkdir $out/bin
                                                                                makeWrapper ${ pkgs.writeShellScript "constructors" ( builtins.concatStringsSep " &&\n\t" constructors ) } $out/bin/constructors --set LN ${ pkgs.coreutils }/bin/ln --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set OUT $out &&
                                                                                $out/bin/constructors &&
                                                                                ALL=${ builtins.toString ( 1 + ( if builtins.typeOf primary.release == "null" then 0 else 1 ) + ( if builtins.typeOf primary.post == "null" then 0 else 1 ) + 1 + 1 ) } &&
                                                                                SUCCESS=$( ${ pkgs.findutils }/bin/find $out/units -mindepth 1 -type l -exec ${ pkgs.coreutils }/bin/readlink {} \; | ${ pkgs.findutils }/bin/find $( ${ pkgs.coreutils }/bin/tee ) -mindepth 1 -maxdepth 1 -type f -name SUCCESS | ${ pkgs.coreutils }/bin/wc --lines ) &&
                                                                                FAILURE=$( ${ pkgs.findutils }/bin/find $out/units -mindepth 1 -type l -exec ${ pkgs.coreutils }/bin/readlink {} \; | ${ pkgs.findutils }/bin/find $( ${ pkgs.coreutils }/bin/tee ) -mindepth 1 -maxdepth 1 -type f -name FAILURE | ${ pkgs.coreutils }/bin/wc --lines ) &&
                                                                                if [ ${ _environment-variable "ALL" } == ${ _environment-variable "SUCCESS" } ]
                                                                                then
                                                                                    ${ pkgs.coreutils }/bin/echo ${ _environment-variable "ALL" } > $out/SUCCESS
                                                                                elif [ ${ _environment-variable "ALL" } == $(( ${ _environment-variable "SUCCESS" } + ${ _environment-variable "FAILURE" } )) ]
                                                                                then
                                                                                    ${ pkgs.coreutils }/bin/echo ${ _environment-variable "FAILURE" } > $out/FAILURE
                                                                                fi
                                                                        '' ;
                                                            name = "tests" ;
                                                            nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                            src = ./. ;
                                                        } ;
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
                                                                ( string "NAME" "init" )
                                                                ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                ( string "TOUCH" "${ pkgs.coreutils }/bin/touch" )
                                                                ( string "UUID" "a0ec4aaa08d8dc652beb39be11f4b9619ec8b69d547c92e249c9fb06c295e13e2fcbf2ad25d60388e8c34241ade94494c598e3d413d7c90f95667b309ed62a8d" )
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
                                                                        "/mount" =
                                                                            {
                                                                                expected = self + "/expected/init/mounts/target" ;
                                                                                initial =
                                                                                    [
                                                                                        "mkdir /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                    } ;
                                                                standard-output = self + "/expected/init/standard-output" ;
                                                            } ;
                                                } ;
                                            list =
                                                let
                                                    foobar =
                                                        name : temporary :
                                                            {
                                                                name = name ;
                                                                value =
                                                                    pkgs.stdenv.mkDerivation
                                                                        {
                                                                            installPhase =
                                                                                ''
                                                                                    ${ pkgs.coreutils }/bin/touch $out &&
                                                                                        if [ -f ${ temporary.tests }/SUCCESS ]
                                                                                        then
                                                                                            ${ pkgs.coreutils }/bin/echo There was success in ${ temporary.tests }.
                                                                                        elif [ -f ${ temporary.tests }/FAILURE ]
                                                                                        then
                                                                                            ${ pkgs.coreutils }/bin/echo There was failure in ${ temporary.tests }. >&2 &&
                                                                                                exit 63
                                                                                        else
                                                                                            ${ pkgs.coreutils }/bin/echo There was error in ${ temporary.tests }. >&2 &&
                                                                                                exit 62
                                                                                        fi &&
                                                                                        ${ pkgs.coreutils }/bin/true
                                                                                '' ;
                                                                            name = name ;
                                                                            src = ./. ;
                                                                        } ;
                                                            } ;
                                                        tests =
                                                            {
                                                                failure =
                                                                    ignore :
                                                                        {
                                                                            arguments = "fd4107d952c0d02f4ea2e8963d673543791619d2ff0178d03222ea551c539c235a516d9f6dbb2c852618c634ead3ebc72d6beff6ee08880d422e10341390a94c" ;
                                                                            status = 66 ;
                                                                        } ;
                                                                success =
                                                                    ignore :
                                                                        {
                                                                            arguments = "5fcf30da8e09e5808370ee26227e38080bc3970d44cf95f50622b96b4b0daad9fdfc511b0bbfa974fc911d211b01b8e1051398b0bd9ca4d322b2f10e614b8474" ;
                                                                        } ;
                                                            } ;
                                                    in
                                                        [
                                                            ( foobar "0-0" ( lib { init = init ; tests = tests ; } ) )
                                                            ( foobar "0-1" ( lib { init = init ; post = post ; tests = tests ; } ) )
                                                            ( foobar "1-0" ( lib { init = init ; release = release ; tests = tests ; } ) )
                                                            ( foobar "1-1" ( lib { init = init ; release = release ; post = post ; tests = tests ; } ) )
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
                                                                ( string "NAME" "post" )
                                                                ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                ( string "TOUCH" "${ pkgs.coreutils }/bin/touch" )
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
                                                                ( string "NAME" "release" )
                                                                ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                ( string "TOUCH" "${ pkgs.coreutils }/bin/touch" )
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