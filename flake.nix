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
                                    at ? pkgs.writeShellScript "at" "$( ${ pkgs.coreutils }/bin/tee ) &" ,
                                    init ? null ,
                                    initializer ? 64 ,
                                    post ? null ,
                                    release ? null ,
                                    standard-error ? 65 ,
                                    tests ? null
                                } :
                                    let
                                        primary =
                                            {
                                                at = if builtins.typeOf at == "set" then at else if builtins.typeOf at == "string" then at else builtins.throw "at is not set, string but ${ builtins.typeOf at }." ;
                                                init = if builtins.typeOf init == "null" then init else if builtins.typeOf init == "string" then init else builtins.throw "init is not null, string but ${ builtins.typeOf init }." ;
                                                initializer = if builtins.typeOf initializer == "int" then initializer else builtins.throw "initializer is not int but ${ builtins.typeOf initializer }." ;
                                                release = if builtins.typeOf release == "null" then release else if builtins.typeOf release == "string" then release else builtins.throw "release is not null, string but ${ builtins.typeOf release }." ;
                                                post = if builtins.typeOf post == "null" then post else if builtins.typeOf post == "string" then post else builtins.throw "post is not null, string but ${ builtins.typeOf post }." ;
                                                standard-error = if builtins.typeOf standard-error == "int" then standard-error else builtins.throw "standard-error is not int but ${ builtins.typeOf standard-error }." ;
                                                tests = if builtins.typeOf tests == "null" then tests else if builtins.typeOf tests == "list" then tests else if builtins.typeOf tests == "set" then tests else builtins.throw "tests is not null, list, set but ${ builtins.typeOf tests }." ;
                                            } ;
                                        setup =
                                            init : release : post : host-path :
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
                                                                [ true 19 19 ]
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
                                                                                        "--run 'export RESOURCE=$( ${ pkgs.coreutils }/bin/mktemp --directory ${ host-path }/XXXXXXXX )'"
                                                                                        "--set RM ${ pkgs.coreutils }/bin/rm"
                                                                                        "--set STORE $out"
                                                                                        "--set TAIL ${ pkgs.coreutils }/bin/tail"
                                                                                        "--run 'export TARGET=${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/target'"
                                                                                        "--set TEARDOWN_ASYNCH ${ teardown-asynch }"
                                                                                        "--set TEARDOWN_SYNCH ${ teardown-synch }"
                                                                                        "--set TRUE ${ pkgs.coreutils }/bin/true"
                                                                                    ]
                                                                                ] ;
                                                                        in
                                                                            ''
                                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                    ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                                    makeWrapper ${ setup } $out/bin/temporary ${ builtins.concatStringsSep " " environment }
                                                                            '' ;
                                                                name = "bin" ;
                                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                                src = ./. ;
                                                            } ;
                                        in
                                            {
                                                temporary = host-path : "${ setup primary.init primary.release primary.post host-path }/bin/temporary" ;
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
                                                                                                            arguments ? [ ] ,
                                                                                                            count ? 2 ,
                                                                                                            expected ,
                                                                                                            file ? null ,
                                                                                                            paste ? null ,
                                                                                                            pipe ? null ,
                                                                                                            sleep ? 32 ,
                                                                                                            status ? 0 ,
                                                                                                            verbose ? false
                                                                                                        } :
                                                                                                            {
                                                                                                                arguments =
                                                                                                                    if builtins.typeOf arguments == "list" then builtins.map ( a : if builtins.typeOf a == "string" then a else builtins.throw "argument is not string but ${ builtins.typeOf a }." ) arguments
                                                                                                                    else builtins.throw "arguments is not list but ${ builtins.typeOf file }." ;
                                                                                                                count = if builtins.typeOf count == "int" then count else builtins.throw "count is not int but ${ builtins.typeOf count }." ;
                                                                                                                expected = if builtins.typeOf expected == "string" then expected else builtins.throw "expected is not string but ${ builtins.typeOf expected }." ;
                                                                                                                file =
                                                                                                                    if builtins.typeOf file == "null" then file
                                                                                                                    else if builtins.typeOf file == "string" then builtins.toFile "file" file
                                                                                                                    else builtins.throw "file is not null, string but ${ builtins.typeOf file }." ;
                                                                                                                paste =
                                                                                                                    if builtins.typeOf paste == "null" then paste
                                                                                                                    else if builtins.typeOf paste == "lambda" then
                                                                                                                        let
                                                                                                                            p =
                                                                                                                                paste "${ builtins.concatStringsSep "" [ "$" "{" "@" "}" ] }" ;
                                                                                                                            in
                                                                                                                                if builtins.typeOf p == "string" then
                                                                                                                                    if status == 0 then builtins.toFile "paste" p
                                                                                                                                    else builtins.throw "it does not make sense to have a failure status and a paste"
                                                                                                                                else builtins.throw "paste temporary is not string but ${ builtins.typeOf p }"
                                                                                                                    else builtins.throw "paste is not lambda, null but ${ builtins.typeOf paste }." ;
                                                                                                                pipe = if builtins.typeOf pipe == "null" then pipe else if builtins.typeOf pipe == "string" then pipe else builtins.throw "pipe is not null, string but ${ builtins.typeOf pipe }." ;
                                                                                                                sleep =
                                                                                                                    if builtins.typeOf sleep == "int" then builtins.toString sleep
                                                                                                                    else builtins.throw "sleep is not int but ${ builtins.typeOf sleep }." ;
                                                                                                                status =
                                                                                                                    if builtins.typeOf status == "int" then
                                                                                                                        let
                                                                                                                            s = builtins.toString status ;
                                                                                                                            in
                                                                                                                                if s == "0" || builtins.typeOf paste == "null" then builtins.toString status
                                                                                                                                else builtins.throw "it does not make sense to have a failure status and a paste"
                                                                                                                    else builtins.throw "status is not int but ${ builtins.typeOf status }." ;
                                                                                                                verbose = if builtins.typeOf verbose == "bool" then builtins.toJSON verbose else builtins.throw "verbose is not bool but ${ builtins.typeOf verbose }." ;
                                                                                                            } ;
                                                                                                    in identity ( value null ) ;
                                                                                            in
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        [
                                                                                                            "${ pkgs.coreutils }/bin/mkdir /build/post"
                                                                                                            "${ pkgs.coreutils }/bin/mkdir /build/temporary"
                                                                                                        ]
                                                                                                        [
                                                                                                            "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                            "${ pkgs.coreutils }/bin/cat ${ secondary.paste } > ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "paste.sh" ] ] ) }"
                                                                                                            "${ pkgs.coreutils }/bin/chmod 0555 ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "paste.sh" ] ] ) }"
                                                                                                            "makeWrapper ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "paste.sh" ] ] ) } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "paste" ] ] ) } --set PATH ${ pkgs.coreutils }/bin"
                                                                                                            (
                                                                                                                let
                                                                                                                    inner =
                                                                                                                        let
                                                                                                                            generator =
                                                                                                                                index :
                                                                                                                                    builtins.concatLists
                                                                                                                                        [
                                                                                                                                            [
                                                                                                                                                "# ${ builtins.toString index }"
                                                                                                                                                "TEMPORARY_STANDARD_ERROR=$( mktemp )"
                                                                                                                                                (
                                                                                                                                                    builtins.concatStringsSep
                                                                                                                                                        " "
                                                                                                                                                        (
                                                                                                                                                            builtins.concatLists
                                                                                                                                                                [
                                                                                                                                                                    [
                                                                                                                                                                        "TEMPORARY=$("
                                                                                                                                                                    ]
                                                                                                                                                                    (
                                                                                                                                                                        if builtins.typeOf secondary.pipe == "null" then [ ]
                                                                                                                                                                        else [ "echo" secondary.pipe "|" ]
                                                                                                                                                                    )
                                                                                                                                                                    [
                                                                                                                                                                        "temporary"
                                                                                                                                                                    ]
                                                                                                                                                                    (
                                                                                                                                                                        if builtins.typeOf secondary.file == "null"  then [ ]
                                                                                                                                                                        else [ "<" secondary.file ]
                                                                                                                                                                    )
                                                                                                                                                                    secondary.arguments
                                                                                                                                                                    [
                                                                                                                                                                        "2>"
                                                                                                                                                                        ( builtins.concatStringsSep "" [ "$" "{" "TEMPORARY_STANDARD_ERROR" "}" ] )
                                                                                                                                                                        ")"
                                                                                                                                                                    ]
                                                                                                                                                            ]
                                                                                                                                                        )
                                                                                                                                                )
                                                                                                                                                "TEMPORARY_STATUS=${ builtins.concatStringsSep "" [ "$" "{" "?" "}" ] }"
                                                                                                                                                ''if [ ${ secondary.verbose } ] || [ ${ if secondary.status == "0" then "" else "!" } -z "$( cat ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY" "}" ] } )" ] ; then cat ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY" "}" ] } >> /post/temporary.standard-output ; fi''
                                                                                                                                                ''if [ ${ secondary.verbose } ] || [ ${ if secondary.status == "0" then "!" else "" } -z "$( cat ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY_STANDARD_ERROR" "}" ] } )" ] ; then cat ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY_STANDARD_ERROR" "}" ] } >> /post/temporary.standard-error ; fi''
                                                                                                                                                "if [ ${ secondary.verbose } ] || [ ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY_STATUS" "}" ] } != ${ secondary.status } ] ; then echo ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY_STATUS" "}" ] } >> /post/temporary.status ; fi"
                                                                                                                                            ]
                                                                                                                                            (
                                                                                                                                                if builtins.typeOf secondary.paste == "null" then [ ]
                                                                                                                                                else
                                                                                                                                                    [
                                                                                                                                                        # ''if [ ! -z "$( cat ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY_STANDARD_ERROR" "}" ] } )" ] || [ ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY_STATUS" "}" ] } != 0 ] ; then exit 63 ; fi''
                                                                                                                                                    ]
                                                                                                                                            )
                                                                                                                                            (
                                                                                                                                                if builtins.typeOf secondary.paste == "null" then [ ]
                                                                                                                                                else
                                                                                                                                                    [
                                                                                                                                                        "PASTE_STANDARD_OUTPUT=$( mktemp )"
                                                                                                                                                        "PASTE_STANDARD_ERROR=$(mktemp )"
                                                                                                                                                        "${ builtins.concatStringsSep "" [ "$" "{" "PASTE" "}" ] } ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY" "}" ] } > ${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STANDARD_OUTPUT" "}" ] } 2> ${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STANDARD_ERROR" "}" ] }"
                                                                                                                                                        "PASTE_STATUS=${ builtins.concatStringsSep "" [ "$" "{" "?" "}" ] }"
                                                                                                                                                        ''if [ ${ secondary.verbose } ] || [ ! -z "${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STANDARD_OUTPUT" "}" ] }" ] ; then cat ${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STANDARD_OUTPUT" "}" ] } >> /post/paste.standard-output ; fi''
                                                                                                                                                        ''if [ ${ secondary.verbose } ] || [ ! -z "${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STANDARD_ERROR" "}" ] }" ] ; then cat ${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STANDARD_ERROR" "}" ] } >> /post/paste.standard-error ; fi''
                                                                                                                                                        "if [ ${ secondary.verbose } ] || [ ${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STATUS" "}" ] } != 0 ] ; then echo ${ builtins.concatStringsSep "" [ "$" "{" "PASTE_STATUS" "}" ] } >> /post/paste.status ; fi"
                                                                                                                                                    ]
                                                                                                                                            )
                                                                                                                                        ] ;
                                                                                                                            in builtins.toFile "inner" ( builtins.concatStringsSep " &&\n\t" ( builtins.concatLists ( builtins.genList generator secondary.count ) ) ) ;
                                                                                                                    in
                                                                                                                        "${ pkgs.coreutils }/bin/cat ${ inner } > ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "inner.sh" ] ] ) }"
                                                                                                            )
                                                                                                            "${ pkgs.coreutils }/bin/chmod 0555 ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "inner.sh" ] ] ) }"
                                                                                                            (
                                                                                                                let
                                                                                                                    post =
                                                                                                                        pkgs.stdenv.mkDerivation
                                                                                                                            {
                                                                                                                                installPhase =
                                                                                                                                    let
                                                                                                                                        source =
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
                                                                                                                                                makeWrapper ${ source } $out --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set COUNT ${ builtins.toString secondary.count } --set CUT ${ pkgs.coreutils }/bin/cut --set DIFF ${ pkgs.diffutils }/bin/diff --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock --set LSOF ${ pkgs.lsof }/bin/lsof --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set MV ${ pkgs.coreutils }/bin/mv --set RM ${ pkgs.coreutils }/bin/rm --set SHA512SUM ${ pkgs.coreutils }/bin/sha512sum --set STAT ${ pkgs.coreutils }/bin/stat --set SYNCH ${ pkgs.uutils-coreutils-noprefix }/bin/sync --set WC ${ pkgs.coreutils }/bin/wc
                                                                                                                                            '' ;
                                                                                                                                name = "post" ;
                                                                                                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                                                                                                src = ./. ;
                                                                                                                            } ;
                                                                                                                    in
                                                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "inner.sh" ] ] ) } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "inner" ] ] ) } --set PASTE ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "paste" ] ] ) } ${ builtins.concatStringsSep "" [ "$" "{" "TEMPORARY" "}" ] } --set PATH ${ pkgs.coreutils }/bin:${ setup primary.init primary.release ( builtins.toString post ) "/build/temporary" }/bin"
                                                                                                            )
                                                                                                            "${ pkgs.coreutils }/bin/cat ${ self + "/scripts/outer.sh" } > ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "outer.sh" ] ] ) }"
                                                                                                            "${ pkgs.coreutils }/bin/chmod 0555 ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "outer.sh" ] ] ) }"
                                                                                                            "makeWrapper ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "outer.sh" ] ] ) } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "outer" ] ] ) } --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock --set INNER ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "inner" ] ] ) } --set RM ${ pkgs.coreutils }/bin/rm --set SLEEP ${ pkgs.coreutils }/bin/sleep --set TIMEOUT ${ secondary.sleep } --set VERBOSE ${ secondary.verbose } --set WC ${ pkgs.coreutils }/bin/wc"
                                                                                                            (
                                                                                                                let
                                                                                                                    user-environment =
                                                                                                                        pkgs.buildFHSUserEnv
                                                                                                                            {
                                                                                                                                extraBwrapArgs =
                                                                                                                                    [
                                                                                                                                        "--bind /build/post /post"
                                                                                                                                        "--bind /build/temporary /temporary"
                                                                                                                                        "--tmpfs /util"
                                                                                                                                    ] ;
                                                                                                                                name = "test" ;
                                                                                                                                runScript = builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "test" ] ( builtins.map builtins.toJSON path ) [ "outer" ] ] ) ;
                                                                                                                            } ;
                                                                                                                    in "${ user-environment }/bin/test"
                                                                                                            )
                                                                                                            "${ pkgs.coreutils }/bin/mv /build/post ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "observed" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                                                            "${ pkgs.coreutils }/bin/rm --recursive --force /build/temp"
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
                                                                    in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ [ "${ pkgs.coreutils }/bin/mkdir $out" ] constructors ] ) ;
                                                            name = "tests" ;
                                                            nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                            src = ./. ;
                                                        } ;
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
                                                        init =
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
                                                        release =
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
                                                    } ;
                                            } ;
                                        temporary =
                                            lib
                                                {
                                                    at =
                                                        pkgs.writeShellScript
                                                            "at"
                                                            ''
                                                                $( ${ pkgs.coreutils }/bin/tee ) &
                                                            '' ;
                                                    init = scripts.shell-scripts.init ;
                                                    initializer = 66 ;
                                                    release = scripts.shell-scripts.release ;
                                                    standard-error = 67 ;
                                                    tests =
                                                        [
                                                            (
                                                                ignore :
                                                                    {
                                                                        arguments = [ "cc5094dbdb456a268a5ba30672881129510d4239be61dfdb553f2f14754bc71094cb9f600b0b7f192e63d7a1b7a61034c554f947dd339cc410ee99eacebe2ccc" ] ;
                                                                        count = 32 ;
                                                                        expected = self + "/mounts/B0hwDMGO" ;
                                                                        # file = "00e8de6ec1ad1419fdd2ac14882333cf6f4adbac1280124179964464492ec4046b0b6b8f4350809c3fea4ce8b4169022f366efec0edc533c3e186d4ae6c7f9b3" ;
                                                                        paste = temporary : "echo - 022f5919fa3e2909c7057e0511ce754c93d7cd159d84ccbf391ee21b87055e07a6ce8804ffa4def7f5dd1e41145a115f9d8d4ca1704e43236c5e56a8bc22bec3 >> ${ temporary }" ;
                                                                        pipe = "1eebb8354b8969ef670f556fcd11b500f2d472c4b4d6eae3c3ce4fd784654189af939005d9348f0359da6184a7096edf20bd35d3746f00f491df0ad7cb31b3b4" ;
                                                                        sleep = 10 ; # 128 ;
                                                                        # status = true ;
                                                                        verbose = true ;
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
                                                                            export TEMP_DIR=$( ${ pkgs.coreutils }/bin/mktemp --directory ) &&
                                                                            ${ pkgs.coreutils }/bin/echo ${ temporary.temporary "/tmp" } &&
                                                                            ${ pkgs.coreutils }/bin/echo ${ temporary.tests }
                                                                    '' ;
                                                                name = "foobar" ;
                                                                src = ./. ;
                                                            } ;
                                                    shell-script = scripts.tests ;
                                                    temporary = temporary.tests ;
                                                } ;
                                            lib = lib ;
                                        } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}