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
                                    archive ? _environment-variable "ARCHIVE" ,
                                    init ? null ,
                                    initialization-error-code ? 66 ,
                                    lock-failure ? 64 ,
                                    over-initialized-target-error-code ? 68 ,
                                    post ? null ,
                                    release ? null ,
                                    resources ? _environment-variable "RESOURCES" ,
                                    self-teardown ? true ,
                                    shell-scripts ? { } ,
                                    stderr-emitted-error-code ? 67 ,
                                    tests ? null ,
                                    uninitialized-target-error-code ? 65 ,
                                } :
                                    let
                                        primary =
                                            let
                                                enrich =
                                                    name : set :
                                                        if builtins.typeOf set == "null" then set
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
                                                                    } ;
                                                                resource =
                                                                    if builtins.hasAttr "resource" set then builtins.getAttr "resource" set
                                                                    else "/resource" ;
                                                                in if eval.success then eval.value else builtins.throw "There was a problem evaluating ${ name }."
                                                        else builtins.throw "${ name } is not null, set but ${ builtins.typeOf set }." ;
                                                enrich-init =
                                                    set :
                                                        if builtins.typeOf set == "set" then
                                                            let
                                                                arguments-minus = builtins.removeAttrs set [ "mount" ] ;
                                                                arguments-plus = arguments-minus // { mounts = mounts ; } ;
                                                                eval = builtins.tryEval ( _shell-script arguments-plus ) ;
                                                                mount =
                                                                    if builtins.hasAttr "resource" set then builtins.getAttr "mount" set
                                                                    else "/mount" ;
                                                                mounts =
                                                                    {
                                                                        "${ mount }" =
                                                                            {
                                                                                host-path = _environment-variable "TARGET_MOUNT" ;
                                                                                is-read-only = false ;
                                                                            } ;
                                                                    } ;
                                                                in if eval.success then eval.value else builtins.throw "There was a problem evaluating init."
                                                        else builtins.throw "init is not set but ${ builtins.typeOf set }." ;
                                                in
                                                    {
                                                        archive =
                                                            if builtins.typeOf archive == "string" then archive
                                                            else builtins.throw "archive is not string but ${ builtins.typeOf archive }." ;
                                                        init = enrich-init init ;
                                                        initialization-error-code =
                                                            if builtins.typeOf initialization-error-code == "int" then builtins.toString initialization-error-code
                                                            else builtins.throw "initialization-error-code is not int but ${ builtins.typeOf initialization-error-code }." ;
                                                        lock-failure =
                                                            if builtins.typeOf lock-failure == "int" then builtins.toString lock-failure
                                                            else builtins.throw "lock-failure is not int but ${ builtins.typeOf lock-failure }." ;
                                                        over-initialized-target-error-code =
                                                            if builtins.typeOf over-initialized-target-error-code == "int" then builtins.toString over-initialized-target-error-code
                                                            else builtins.throw "over-initialized-target-error-code is not int but ${ builtins.typeOf over-initialized-target-error-code }." ;
                                                        post = enrich "post" post ;
                                                        release = enrich "release" release ;
                                                        resources =
                                                            if builtins.typeOf resources == "string" then resources
                                                            else builtins.throw "resources is not string but ${ builtins.typeOf resources }." ;
                                                        self-teardown =
                                                            if builtins.typeOf self-teardown == "bool" then self-teardown
                                                            else builtins.throw "self-teardown is not bool but ${ builtins.typeOf self-teardown }." ;
                                                        stderr-emitted-error-code =
                                                            if builtins.typeOf stderr-emitted-error-code == "int" then builtins.toString stderr-emitted-error-code
                                                            else builtins.throw "stderr-emitted-error-code is not int but ${ builtins.typeOf stderr-emitted-error-code }." ;
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
                                                                                                archive ,
                                                                                                arguments ? null ,
                                                                                                count ? 2 ,
                                                                                                file ? null ,
                                                                                                paste ? null ,
                                                                                                pipe ? null ,
                                                                                                status ? 0
                                                                                            } :
                                                                                                {
                                                                                                    archive =
                                                                                                        if builtins.typeOf archive == "string" then
                                                                                                            if builtins.pathExists archive then archive
                                                                                                            else builtins.throw "the path for ${ archive } does not exist"
                                                                                                        else builtins.throw "archive is not string but ${ builtins.typeOf archive }." ;
                                                                                                    arguments =
                                                                                                        if builtins.typeOf arguments == "list" then builtins.map ( value : if builtins.typeOf value == "string" then value else builtins.throw "argument is not string but ${ builtins.typeOf value }." ) arguments
                                                                                                        else if builtins.typeOf arguments == "null" then [ ]
                                                                                                        else if builtins.typeOf arguments == "string" then [ arguments ]
                                                                                                        else builtins.throw "arguments is not list, null, string but ${ builtins.typeOf arguments }." ;
                                                                                                    count =
                                                                                                        if builtins.typeOf count == "int" then count
                                                                                                        else builtins.throw "count is not int but ${ builtins.typeOf count }." ;
                                                                                                    file =
                                                                                                        if builtins.typeOf file == "null" then [ ]
                                                                                                        else if builtins.typeOf file == "string" then [ "< ${ builtins.toFile "file" file }" ]
                                                                                                        else builtins.throw "file is not null, string but ${ builtins.typeOf file }." ;
                                                                                                    paste =
                                                                                                        if builtins.typeOf paste == "lambda" then
                                                                                                            if secondary.status == 0 then
                                                                                                                let
                                                                                                                    generator =
                                                                                                                        index :
                                                                                                                            let
                                                                                                                                value = paste ( _environment-variable "CANDIDATE_${ builtins.toString index }" ) ;
                                                                                                                                in if builtins.typeOf value == "string" then value else builtins.throw "paste is not string but ${ builtins.typeOf paste }." ;
                                                                                                                    in builtins.concatStringsSep " &&\n\t" ( builtins.genList generator secondary.count )
                                                                                                                else builtins.throw "it does not make sense to define paste when status is not zero."
                                                                                                        else if builtins.typeOf paste == "null" then paste
                                                                                                        else builtins.throw "paste is not lambda, null but ${ builtins.typeOf paste }." ;
                                                                                                    pipe =
                                                                                                        if builtins.typeOf pipe == "null" then [ ]
                                                                                                        else if builtins.typeOf pipe == "string" then
                                                                                                            if builtins.typeOf secondary.file == "null" then [ "cat ${ builtins.toFile "pipe" pipe } |" ]
                                                                                                            else builtins.throw "if we define both a pipe and a file then the file overrides the pipe"
                                                                                                        else builtins.throw "pipe is not null, string but ${ builtins.typeOf pipe }." ;
                                                                                                    status =
                                                                                                        if builtins.typeOf status == "int" then status
                                                                                                        else builtins.throw "status is not int but ${ builtins.typeOf status }." ;
                                                                                                } ;
                                                                                        in identity ( value null ) ;
                                                                                in
                                                                                    {
                                                                                        mounts =
                                                                                            {
                                                                                                "/archive" =
                                                                                                    {
                                                                                                        expected = secondary.archive ;
                                                                                                        initial = "mkdir /mount/target" ;
                                                                                                    } ;
                                                                                                "${ primary.resources }" =
                                                                                                    {
                                                                                                        expected = self + "/expected/setup/mounts/resources" ;
                                                                                                        initial = "mkdir /mount/target" ;
                                                                                                    } ;
                                                                                            } ;
                                                                                        test =
                                                                                            let
                                                                                                inner =
                                                                                                    pkgs.writeShellScript
                                                                                                        "inner"
                                                                                                        ''
                                                                                                            true
                                                                                                        '' ;
                                                                                                in builtins.toString inner ;
                                                                                    } ;
                                                                    null = path : value : null ;
                                                                }
                                                                { }
                                                                tests ;
                                                        uninitialized-target-error-code =
                                                            if builtins.typeOf uninitialized-target-error-code == "int" then builtins.toString uninitialized-target-error-code
                                                            else builtins.throw "uninitialized-target-error-code is not int but ${ builtins.typeOf uninitialized-target-error-code }." ;
                                                    } ;
                                        setup-fun =
                                            self-teardown : teardown :
                                                _shell-script
                                                    {
                                                        extensions =
                                                            {
                                                                has-standard-input = name : "export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/false ; fi )" ;
                                                                originator-pid =
                                                                    name :
                                                                        let
                                                                            grandparent-pid = "${ pkgs.procps }/bin/ps -p $( ${ parent-pid } ) -o ppid= | ${ pkgs.findutils }/bin/xargs" ;
                                                                            greatgrandparent-pid = "${ pkgs.procps }/bin/ps -p $( ${ grandparent-pid } ) -o ppid= | ${ pkgs.findutils }/bin/xargs" ;
                                                                            parent-pid = "${ pkgs.procps }/bin/ps -p ${ _environment-variable "$" } -o ppid= | ${ pkgs.findutils }/bin/xargs" ;
                                                                            in
                                                                                "export ${ name }=$( if [ -t 0 ] ; then ${ grandparent-pid } ; elif [ -p /proc/self/fd/0 ] ; then ${ greatgrandparent-pid } ; elif [ -f /proc/self/fd/0 ] ; then ${ greatgrandparent-pid } ; else ${ grandparent-pid } ; fi ; )" ;
                                                                standard-input = name : "export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )" ;
                                                                string = name : value : "export ${ name }=\"${ builtins.toString value }\"" ;
                                                            } ;
                                                        mounts =
                                                            {
                                                                "/archive" =
                                                                    {
                                                                        host-path = primary.archive ;
                                                                        is-read-only = false ;
                                                                    } ;
                                                                "${ primary.resources }" =
                                                                    {
                                                                        host-path = primary.resources ;
                                                                        is-read-only = false ;
                                                                    } ;
                                                            } ;
                                                        name = "setup" ;
                                                        profile =
                                                            { has-standard-input , originator-pid , standard-input , string } :
                                                                [
                                                                    ( string "BASENAME" "${ pkgs.coreutils }/bin/basename" )
                                                                    ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                    ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                    ( has-standard-input "HAS_STANDARD_INPUT" )
                                                                    ( string "INIT" primary.init.shell-script )
                                                                    ( string "INITIALIZATION_ERROR_CODE" primary.initialization-error-code )
                                                                    ( string "MAKE_WRAPPER" "${ pkgs.makeWrapper }" )
                                                                    ( string "MAKE_WRAPPER_TEARDOWN" "${ teardown.shell-script }" )
                                                                    ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
                                                                    ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                    ( originator-pid "ORIGINATOR_PID" )
                                                                    ( string "OVER_INITIALIZED_TARGET_ERROR_CODE" primary.over-initialized-target-error-code )
                                                                    ( string "RESOURCES" primary.resources )
                                                                    ( standard-input "STANDARD_INPUT" )
                                                                    ( string "STDERR_EMITTED_ERROR_CODE" primary.stderr-emitted-error-code )
                                                                    ( string "UNINITIALIZED_TARGET_ERROR_CODE" primary.uninitialized-target-error-code )
                                                                    ( string "WC" "${ pkgs.coreutils }/bin/wc" )
                                                                    ( string "MOUNT" "${ pkgs.mount }/bin/mount" ) # KLUDGE
                                                                    ( string "GREP" "${ pkgs.gnugrep }/bin/grep" ) # KLUDGE
                                                                ] ;
                                                        script = self + "/setup.sh" ;
                                                        tests = primary.tests ;
                                                    } ;
                                        setup = setup-fun primary.self-teardown teardown ;
                                        setup-mock = setup-fun false teardown-mock ;
                                        teardown-fun =
                                            post :
                                                _shell-script
                                                    {
                                                        extensions =
                                                            {
                                                                string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                            } ;
                                                        mounts =
                                                            {
                                                                "/archive" =
                                                                    {
                                                                        host-path = "/archive" ;
                                                                        is-read-only = false ;
                                                                    } ;
                                                                "/mount" =
                                                                    {
                                                                        host-path = _environment-variable "RESOURCES" ;
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
                                                                        ]
                                                                        ( if builtins.typeOf post == "null" then [ ] else [ ( string "POST" post.shell-script ) ] )
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
                                                                            [ 4 ]
                                                                            [ 5 ]
                                                                            [ 6 ]
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 8 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 9 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 10 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 11 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 12 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 13 ] )
                                                                            ( if builtins.typeOf post == "null" then [ ] else [ 16 ] )
                                                                            [ 18 ]
                                                                            [ 19 ]
                                                                            [ 20 ]
                                                                            [ 21 ]
                                                                            [ 22 ]
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
                                                                            "/archive" =
                                                                                {
                                                                                    expected = self + "/expected/teardown/mounts/archive" ;
                                                                                    initial =
                                                                                        [
                                                                                            "mkdir /mount/target"
                                                                                            "echo d5bb0df4dcfee94311969902570c6c91dbb52302931bf46a9952d8f52aa1fe67248f32b6a39e75e561937c7c8d5fa30e82f277e5a1d40210bc7798c5fc7e1494 > /mount/target/uuid"
                                                                                        ] ;
                                                                                } ;
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
                                                                    profile =
                                                                        { string } :
                                                                            builtins.concatLists
                                                                                [
                                                                                    [
                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                        ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                        ( string "LOCK_FAILURE" primary.lock-failure )
                                                                                        ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                        ( string "ORIGINATOR_PID" 9999 )
                                                                                    ]
                                                                                    ( if builtins.typeOf primary.post == "null" then [ ] else [ ( string "POST" primary.post.shell-script ) ] )
                                                                                    ( if builtins.typeOf primary.release == "null" then [ ] else [ ( string "RELEASE" primary.release.shell-script ) ] )
                                                                                    [
                                                                                        ( string "RESOURCE_NAME" "resource" )
                                                                                        ( string "RESOURCE" "$( ${ _environment-variable "MKTEMP" } )" )
                                                                                        ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                        ( string "STATUS" 0 )
                                                                                        ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                                        ( string "TARGET" "$( ${ _environment-variable "MKTEMP" } )" )
                                                                                        ( string "TRUE" "${ pkgs.coreutils }/bin/true" )
                                                                                    ]
                                                                                ] ;
                                                                    standard-output = self + "/expected/teardown/standard-output-${ if builtins.typeOf primary.release == "null" then "0" else "1" }-${ if builtins.typeOf primary.post == "null" then "0" else "1" }" ;
                                                                } ;
                                                } ;
                                        teardown = teardown-fun primary.post ;
                                        teardown-mock = teardown-fun vacuum ;
                                        vacuum =
                                            _shell-script
                                                {
                                                    extensions =
                                                        {
                                                            string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                        } ;
                                                    mounts =
                                                        {
                                                            "/archive" =
                                                                {
                                                                    host-path = "/archive" ;
                                                                    is-read-only = false ;
                                                                } ;
                                                            "/resource" =
                                                                {
                                                                    host-path = "${ _environment-variable "RESOURCE" }" ;
                                                                    is-read-only = true ;
                                                                } ;
                                                        } ;
                                                    name = "vacuum" ;
                                                    profile =
                                                        { string } :
                                                            [
                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                ( string "CUT" "${ pkgs.coreutils }/bin/cut" )
                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                ( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
                                                                ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                ( string "STAT" "${ pkgs.coreutils }/bin/stat" )
                                                                ( string "WC" "${ pkgs.coreutils }/bin/wc" )
                                                            ] ;
                                                    script = self + "/vacuum.sh" ;
                                                } ;
                                        in
                                            {
                                                post-check =
                                                    pkgs.writeShellScript
                                                        "post-check"
                                                        ''
                                                            export ARCHIVE=$( ${ pkgs.coreutils }/bin/mktemp --directory ) &&
                                                                export RESOURCES=$( ${ pkgs.coreutils }/bin/mktemp --directory ) &&
                                                                ( ${ pkgs.bash }/bin/bash -c "TEMPORARY=$( ${ setup-mock.shell-script } )" & ) &&
                                                                ${ pkgs.coreutils }/bin/sleep 1s &&
                                                                ${ pkgs.coreutils }/bin/echo ARCHIVE=${ _environment-variable "ARCHIVE" } RESOURCES=${ _environment-variable "RESOURCES" } &&
                                                                ${ pkgs.findutils }/bin/find ${ _environment-variable "RESOURCES" } | ${ pkgs.coreutils }/bin/sort
                                                        '' ;
                                                shell-script = setup.shell-script ;
                                                tests =
                                                    pkgs.stdenv.mkDerivation
                                                        {
                                                            installPhase =
                                                                let
                                                                    constructors =
                                                                        builtins.concatLists
                                                                            [
                                                                                [
                                                                                    "${ _environment-variable "MKDIR" } ${ _environment-variable "OUT" }/links"
                                                                                    "${ _environment-variable "LN" } --symbolic ${ primary.init.tests } ${ _environment-variable "OUT" }/links/init"
                                                                                ]
                                                                                ( if builtins.typeOf primary.release == "null" then [ ] else [ "${ _environment-variable "LN" } --symbolic ${ primary.release.tests } ${ _environment-variable "OUT" }/links/release" ] )
                                                                                ( if builtins.typeOf primary.post == "null" then [ ] else [ "${ _environment-variable "LN" } --symbolic ${ primary.post.tests } ${ _environment-variable "OUT" }/links/post" ] )
                                                                                [
                                                                                    "${ _environment-variable "LN" } --symbolic ${ setup.tests } ${ _environment-variable "OUT" }/links/setup"
                                                                                    "${ _environment-variable "LN" } --symbolic ${ teardown.tests } ${ _environment-variable "OUT" }/links/teardown"
                                                                                    "${ _environment-variable "LN" } --symbolic ${ vacuum.tests } ${ _environment-variable "OUT" }/links/vacuum"
                                                                                ]
                                                                            ] ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                ${ pkgs.coreutils }/bin/mkdir $out/bin
                                                                                makeWrapper ${ pkgs.writeShellScript "constructors" ( builtins.concatStringsSep " &&\n\t" constructors ) } $out/bin/constructors --set LN ${ pkgs.coreutils }/bin/ln --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set OUT $out &&
                                                                                $out/bin/constructors &&
                                                                                ALL=${ builtins.toString ( 1 + ( if builtins.typeOf primary.release == "null" then 0 else 1 ) + ( if builtins.typeOf primary.post == "null" then 0 else 1 ) + 1 + 1 + 1 ) } &&
                                                                                SUCCESS=$( ${ pkgs.findutils }/bin/find $out/links -mindepth 1 -type l -exec ${ pkgs.coreutils }/bin/readlink {} \; | ${ pkgs.findutils }/bin/find $( ${ pkgs.coreutils }/bin/tee ) -mindepth 1 -maxdepth 1 -type f -name SUCCESS | ${ pkgs.coreutils }/bin/wc --lines ) &&
                                                                                FAILURE=$( ${ pkgs.findutils }/bin/find $out/links -mindepth 1 -type l -exec ${ pkgs.coreutils }/bin/readlink {} \; | ${ pkgs.findutils }/bin/find $( ${ pkgs.coreutils }/bin/tee ) -mindepth 1 -maxdepth 1 -type f -name FAILURE | ${ pkgs.coreutils }/bin/wc --lines ) &&
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
                                                    script = self + "/init.sh" ;
                                                    tests =
                                                        ignore :
                                                            {
                                                                mounts =
                                                                    {
                                                                        "/mount" =
                                                                            {
                                                                                expected = self + "/expected/init/mounts/target" ;
                                                                                initial =
                                                                                    [
                                                                                        "mkdir /mount/target"
                                                                                    ] ;
                                                                            } ;
                                                                    } ;
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
                                                                                        ${ pkgs.coreutils }/bin/echo The shell-script is ${ temporary.shell-script }. &&
                                                                                        ${ pkgs.coreutils }/bin/echo The post-checks for shell-script is ${ temporary.post-check }. &&
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
                                                                                        exit 61
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
                                                                            archive = self + "/expected/setup/mounts/archive" ;
                                                                            arguments = "fd4107d952c0d02f4ea2e8963d673543791619d2ff0178d03222ea551c539c235a516d9f6dbb2c852618c634ead3ebc72d6beff6ee08880d422e10341390a94c" ;
                                                                            status = 66 ;
                                                                        } ;
                                                                success =
                                                                    ignore :
                                                                        {
                                                                            archive = self + "/expected/setup/mounts/archive" ;
                                                                            arguments = "5fcf30da8e09e5808370ee26227e38080bc3970d44cf95f50622b96b4b0daad9fdfc511b0bbfa974fc911d211b01b8e1051398b0bd9ca4d322b2f10e614b8474" ;
                                                                            file = "db2717f674d6e7dde381029c828b969e6bc5e27ebf99d134264e3373fb892f42a988e34b0d9ff6b8609ed131b786ad1b9f6e82c9f45cc6ed50860e690e70bedf" ;
                                                                            paste = candidate : "echo 275a6f1d6dfa76aa2bf189957d0dea80d6f61a7c42b373105f9307ca56917c4eca5dd54ebc13da72aded4fed2929c65f92e49bd474e616532cc29c64bb257a34 >> ${ candidate }/uuid" ;
                                                                            # pipe = "8f3bf8bd37789fa3bba0f5d7dcabc848d42e9dfa1bca75c05e020ac8830912100623212067be8699aa489d5ee13367249a5f6ad3921296d4b9699375a9bc4ca6" ;
                                                                         } ;
                                                            } ;
                                                    in
                                                        [
                                                            # ( foobar "0-0" ( lib { init = init ; tests = tests ; } ) )
                                                            # ( foobar "0-1" ( lib { init = init ; post = post ; tests = tests ; } ) )
                                                            # ( foobar "1-0" ( lib { init = init ; release = release ; tests = tests ; } ) )
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
                                                                    } ;
                                                                standard-output = self + "/expected/release/standard-output" ;
                                                            } ;
                                                } ;
                                            in builtins.listToAttrs ( list ) ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}