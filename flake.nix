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
                                    initializer ? 64 ,
                                    resource-mask ? "temporary.XXXXXXXX" ,
                                    standard-error ? 65 ,
                                    temporary ? null ,
                                } :
                                    let
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    installPhase =
                                                        let
                                                            elem =
                                                                path : value :
                                                                    let
                                                                        elem = validate [ "lambda" "list" "set" ] path value ;
                                                                        type = builtins.typeOf elem ;
                                                                        in
                                                                            if type == "lambda" then lambda path elem
                                                                            else if type == "list" then list path elem
                                                                            else if type == "set" then set path elem
                                                                            else elem ;
                                                            lambda =
                                                                path : value : builtins.getAttr "constructors" ( value "$out" ) ;
                                                            list =
                                                                path : value :
                                                                    builtins.concatLists
                                                                        [
                                                                            [
                                                                                "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "temporary" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                            ]
                                                                            ( builtins.concatLists ( builtins.genList ( index : elem ( builtins.concatLists [ path [ index ] ] ) ( builtins.elemAt value index ) ) ( builtins.length value ) ) )
                                                                        ] ;
                                                            set =
                                                                path : value :
                                                                    builtins.concatLists
                                                                        [
                                                                            # [
                                                                            #      "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "temporary" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                            # ]
                                                                            ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( name : value : elem ( builtins.concatLists [ path [ name ] ] ) value ) value ) ) )
                                                                        ] ;
                                                            in builtins.concatStringsSep
                                                                " &&\n"
                                                                    (
                                                                        builtins.concatLists
                                                                            [
                                                                                [
                                                                                    "${ pkgs.coreutils }/bin/mkdir $out"
                                                                                ]
                                                                                [
                                                                                    "${ pkgs.coreutils }/bin/mkdir $out/scripts"
                                                                                ]
                                                                                [
                                                                                    "${ pkgs.coreutils }/bin/mkdir $out/temporary"
                                                                                ]
                                                                                ( elem [ ] dependencies )
                                                                            ]
                                                                    ) ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    name = "temporary-implementation" ;
                                                    src = ./. ;
                                                } ;
                                        dependencies =
                                            let
                                                elem =
                                                    path : value :
                                                        let
                                                            elem = validate [ "lambda" "list" "null" "set" ] path value ;
                                                            type = builtins.typeOf elem ;
                                                            in
                                                                if type == "lambda" then lambda path elem
                                                                else if type == "list" then list path elem
                                                                else if type == "null" then lambda path ( x : { } )
                                                                else if type == "set" then set path elem
                                                                else elem ;
                                                lambda =
                                                    path : value : base :
                                                        let
                                                            constructors =
                                                                let
                                                                    executable =
                                                                        name : { environment , executable } :
                                                                            [
                                                                                "${ pkgs.coreutils }/bin/cat ${ executable } > ${ directory }/${ name }.sh"
                                                                                "${ pkgs.coreutils }/bin/chmod 0555 ${ directory }/${ name }.sh"
                                                                                (
                                                                                    let
                                                                                        injection =
                                                                                            {
                                                                                                grandparent-pid = grandparent-pid ;
                                                                                                is-file = is-file ;
                                                                                                is-interactive = is-interactive ;
                                                                                                is-pipe = is-pipe ;
                                                                                                parent-pid = parent-pid ;
                                                                                                path = name : index : "--set ${ name } ${ builtins.toString ( builtins.elemAt path index ) }" ;
                                                                                                string = name : value : "--set ${ name } ${ builtins.toString value }" ;
                                                                                                resource = { name ? "RESOURCE" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                                                                standard-input = { name ? "STANDARD_INPUT" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )'" ;
                                                                                                target = { name ? "TARGET" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/target'" ;
                                                                                                temporary = name : fun : "--set ${ name } ${ fun temporary_ }" ;
                                                                                            } ;
                                                                                        in "makeWrapper ${ directory }/${ name }.sh ${ directory }/${ name } ${ builtins.concatStringsSep " " ( environment injection ) }"
                                                                                )
                                                                            ] ;
                                                                    in
                                                                        builtins.concatLists
                                                                            [
                                                                                [
                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ directory }"
                                                                                ]
                                                                                ( executable "setup" setup )
                                                                                ( executable "teardown-asynch" teardown-asynch )
                                                                                ( executable "teardown-synch" teardown-synch )
                                                                                ( if builtins.typeOf point.init == "null" then [ ] else executable "init" point.init )
                                                                                ( if builtins.typeOf point.release == "null" then [ ] else executable "release" point.release )
                                                                                ( if builtins.typeOf point.post == "null" then [ ] else executable "post" point.post )
                                                                                ( executable "setup-test" setup-test )
                                                                                ( executable "post-test" post-test )
                                                                            ] ;
                                                            directory = builtins.concatStringsSep "/" ( builtins.concatLists [ [ base "temporary" ] ( builtins.map builtins.toJSON path ) ] ) ;
                                                            identity =
                                                                { init ? null , post ? null , release ? null , tests ? [ ] , enable ? true } :
                                                                    {
                                                                        init = validate [ "null" "set" ] path init ;
                                                                        post = validate [ "null" "set" ] path post ;
                                                                        release = validate [ "null" "set" ] path release ;
                                                                        tests = validate [ "list" ] path tests ;
                                                                        enable = validate [ "bool" ] path enable ;
                                                                    } ;
                                                            point = identity ( value shell-script ) ;
                                                            setup =
                                                                {
                                                                    environment =
                                                                        { grandparent-pid , is-file , is-interactive , is-pipe , parent-pid , string , ... } :
                                                                            [
                                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( grandparent-pid { } )
                                                                                ( string "INIT" ( builtins.concatStringsSep "/" [ base "/init" ] ) )
                                                                                ( string "INITIALIZER" initializer )
                                                                                ( is-file { } )
                                                                                ( is-interactive { } )
                                                                                ( is-pipe { } )
                                                                                ( string "LN" "${ pkgs.coreutils }/bin/ln" )
                                                                                ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                ( parent-pid { } )
                                                                                ( string "POST" ( builtins.concatStringsSep "/" [ base "/post" ] ) )
                                                                                ( string "RELEASE" ( builtins.concatStringsSep "/" [ base "/release" ] ) )
                                                                                ( string "RESOURCE_MASK" "${ resource-mask }" )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "STANDARD_ERROR" standard-error )
                                                                                ( string "TEARDOWN_ASYNCH" ( builtins.concatStringsSep "/" [ base "/teardown-asynch" ] ) )
                                                                                ( string "TEARDOWN_SYNCH" ( builtins.concatStringsSep "/" [ base "/teardown-synch" ] ) )
                                                                                ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                            ] ;
                                                                    executable = self + "/scripts/implementation/setup.sh" ;
                                                                } ;
                                                            setup-test =
                                                                {
                                                                    environment =
                                                                        { grandparent-pid , is-file , is-interactive , is-pipe , parent-pid , string , ... } :
                                                                            [
                                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( grandparent-pid { } )
                                                                                ( string "INIT" ( builtins.concatStringsSep "/" [ base "/init" ] ) )
                                                                                ( string "INITIALIZER" initializer )
                                                                                ( is-file { } )
                                                                                ( is-interactive { } )
                                                                                ( is-pipe { } )
                                                                                ( string "LN" "${ pkgs.coreutils }/bin/ln" )
                                                                                ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                ( parent-pid { } )
                                                                                ( string "POST" ( builtins.concatStringsSep "/" [ base "/post-test" ] ) )
                                                                                ( string "RELEASE" ( builtins.concatStringsSep "/" [ base "/release" ] ) )
                                                                                ( string "RESOURCE_MASK" "${ resource-mask }" )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "STANDARD_ERROR" standard-error )
                                                                                ( string "TEARDOWN_ASYNCH" ( builtins.concatStringsSep "/" [ base "/teardown-asynch" ] ) )
                                                                                ( string "TEARDOWN_SYNCH" ( builtins.concatStringsSep "/" [ base "/teardown-synch" ] ) )
                                                                                ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                            ] ;
                                                                    executable = self + "/scripts/implementation/setup.sh" ;
                                                                } ;
                                                            post-test =
                                                                {
                                                                    environment =
                                                                        { resource , string , ... } :
                                                                            [
                                                                                ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                ( string "DIFF" "${ pkgs.diffutils }/bin/diff" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                ( resource { } )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                            ] ;
                                                                    executable = self + "/scripts/test/temporary/post.sh" ;
                                                                } ;
                                                            teardown-asynch =
                                                                {
                                                                    environment =
                                                                        { string , ... } :
                                                                            [
                                                                                ( string "AT" "${ at }" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( string "NICE" "${ pkgs.coreutils }/bin/nice" )
                                                                                ( string "TEARDOWN_SYNCH" "$out/teardown-synch" )
                                                                            ] ;
                                                                    executable = self + "/scripts/implementation/teardown-asynch.sh" ;
                                                                } ;
                                                            teardown-synch =
                                                                {
                                                                    environment =
                                                                        { string , ... } :
                                                                            [
                                                                                ( string "BASENAME" "${ pkgs.coreutils }/bin/basename" )
                                                                                ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                                ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                            ] ;
                                                                    executable = self + "/scripts/implementation/teardown-synch.sh" ;
                                                                } ;
                                                            shell-script =
                                                                { environment ? x : [ ] , executable } :
                                                                    {
                                                                        environment = environment ;
                                                                        executable = executable ;
                                                                    } ;
                                                            in
                                                                {
                                                                    constructors = constructors ;
                                                                    directory =
                                                                        if point.enable then builtins.concatStringsSep "/" [ directory "setup" ]
                                                                        else builtins.throw "The temporary at ${ builtins.concatStringsSep " / " ( builtins.map builtins.toJSON path ) } is disabled." ;
                                                                } ;
                                                list = path : value : builtins.genList ( index : elem ( builtins.concatLists [ path [ index ] ] ) ( builtins.elemAt value index ) ) ( builtins.length value ) ;
                                                set = path : value : builtins.mapAttrs ( name : value : elem ( builtins.concatLists [ path [ name ] ] ) value ) value ;
                                                in elem [ ] temporary ;
                                        grandparent-pid = { name ? "GRANDPARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                                        is-file = { name ? "IS_FILE" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-interactive = { name ? "IS_INTERACTIVE" } : "--run 'export ${ name }=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-pipe = { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        parent-pid = { name ? "PARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                                        resolve = derivation : path : name : builtins.concatStringsSep "/" ( builtins.map builtins.toString [ derivation ( builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.toJSON ( builtins.concatLists [ path [ name ] ] ) ) ) ) ] ) ;
                                        temporary_ =
                                            let
                                                elem =
                                                    path : value :
                                                        let
                                                            elem = validate [ "lambda" "list" "set" ] path value ;
                                                            type = builtins.typeOf elem ;
                                                            in
                                                                if type == "lambda" then lambda path elem
                                                                else if type == "list" then list path elem
                                                                else if type == "set" then set path elem
                                                                else elem ;
                                                lambda = path : value : builtins.concatStringsSep "/" [ ( builtins.getAttr "directory" ( value derivation ) ) ] ;
                                                list = path : value : builtins.genList ( index : elem ( builtins.concatLists [ path [ index ] ] ) ( builtins.elemAt value index ) ) ( builtins.length value ) ;
                                                set = path : value : builtins.mapAttrs ( name : value : elem ( builtins.concatLists [ path [ name ] ] ) value ) value ;
                                                in elem [ ] dependencies ;
                                        validate =
                                            valid : path : value :
                                                if builtins.any ( t : builtins.typeOf value == t ) valid then value
                                                else builtins.throw "The value provided at ${ builtins.concatStringsSep " / " ( builtins.map builtins.toJSON path ) } is not ${ builtins.concatStringsSep " , " valid } but ${ builtins.typeOf value }.  It is ${ if builtins.any ( t : builtins.typeOf value == t ) [ "bool" "float" "int" "path" "string" ] then builtins.toJSON value else "unstringable" }." ;
                                        in
                                            {
                                                temporary = temporary_ ;
                                            } ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        pkgs.stdenv.mkDerivation
                                            {
                                                installPhase =
                                                    let
                                                        resources =
                                                            {
                                                                foobar =
                                                                    lib
                                                                        {
                                                                            caller = self ;
                                                                            initializer = 66 ;
                                                                            resource-mask = "temporary.foobar.XXXXXXXX" ;
                                                                            standard-error = 67 ;
                                                                            temporary =
                                                                                {
                                                                                    a4374430e2a3ace64473d4c54891829ec96b4bfcd6ed6688d30cc4ff486b13dd9366bd4cb808d30c97471e99f200c605b28e7a4b7211834492d4f361c05b41c5 =
                                                                                        shell-script :
                                                                                            {
                                                                                                init =
                                                                                                    shell-script
                                                                                                        {
                                                                                                            environment =
                                                                                                                { is-file , is-pipe , resource , path , standard-input , string , target , temporary , ... } :
                                                                                                                    [
                                                                                                                        ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                        ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                                                                        ( string "HAS_STANDARD_ERROR" "false" )
                                                                                                                        ( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
                                                                                                                        ( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
                                                                                                                        ( string "JQ" "${ pkgs.jq }/bin/jq" )
                                                                                                                        ( path "PATH_SEED" 0 )
                                                                                                                        ( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ; } )
                                                                                                                        ( string "SED" "${ pkgs.gnused }/bin/sed" )
                                                                                                                        ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                                                                        ( string "STANDARD_ERROR" "1a88e30079d768b4e704cb0e4f881a992b9323aeef7ec7dafd953c26fa5d83e941609567b6571e0cceb7647dc8fc4e59ea9ee2b76ffb7c06a73396119b23854b" )
                                                                                                                        ( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
                                                                                                                        ( string "STANDARD_OUTPUT" "92dedc378e51cbc9794519646c0229514feae28a05c596a9e3fc424e6ba08acba0ef6a922562c613b4954414d1427e3dab6827561d33af05d78bb4a893a10aca" )
                                                                                                                        ( string "STATUS" "0" )
                                                                                                                        ( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
                                                                                                                        ( string "TEMPLATE_FILE" ( self + "/scripts/test/temporary/executable.json" ) )
                                                                                                                        ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                                                    ] ;
                                                                                                            executable = self + "/scripts/test/temporary/executable.sh" ;
                                                                                                        } ;
                                                                                                release =
                                                                                                   shell-script
                                                                                                       {
                                                                                                           environment =
                                                                                                               { is-file , is-pipe , resource , path , standard-input , string , target , temporary , ... } :
                                                                                                                   [
                                                                                                                       ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                                       ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                       ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                                                                       ( string "HAS_STANDARD_ERROR" "false" )
                                                                                                                       ( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
                                                                                                                       ( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
                                                                                                                       ( string "JQ" "${ pkgs.jq }/bin/jq" )
                                                                                                                       ( path "PATH_SEED" 0 )
                                                                                                                       ( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ; } )
                                                                                                                       ( string "SED" "${ pkgs.gnused }/bin/sed" )
                                                                                                                       ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                                                                       ( string "STANDARD_ERROR" "73a1dfc58fd98ea3273295a3bba6c69a400b5ff382076a3ef54b8f7c2243e42bf769c0a55ac520e05059cc362eda16569db6404d1698fdd438faefdf3ccf5b87" )
                                                                                                                       ( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
                                                                                                                       ( string "STANDARD_OUTPUT" "4a0047d9bf72b1d8bb481e61103e2208596a20661a2e47f3ef30dbcf14a60da980c565c7d7b90dd25dbadb97b1df7d054216fc77efee0dc8869d1626a90033d9" )
                                                                                                                       ( string "STATUS" "0" )
                                                                                                                       ( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
                                                                                                                       ( string "TEMPLATE_FILE" ( self + "/scripts/test/temporary/executable.json" ) )
                                                                                                                       ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                                                   ] ;
                                                                                                           executable = self + "/scripts/test/temporary/executable.sh" ;
                                                                                                       } ;
                                                                                                post =
                                                                                                    shell-script
                                                                                                        {
                                                                                                            environment =
                                                                                                                { resource , string , temporary , ... } :
                                                                                                                    [
                                                                                                                        ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                                                        # ( temporary "POST" ( temporary : builtins.trace ( builtins.concatStringsSep " ; " ( builtins.attrNames temporary ) ) temporary.util ) )
                                                                                                                        ( resource { name = "d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3" ; } )
                                                                                                                        ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                                                        ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                                                    ] ;
                                                                                                            executable = self + "/scripts/test/temporary/post.sh" ;
                                                                                                        } ;
                                                                                            } ;
                                                                                    util =
                                                                                        shell-script :
                                                                                            {
                                                                                                init =
                                                                                                    shell-script
                                                                                                        {
                                                                                                            executable = self + "/scripts/test/util/post.sh" ;
                                                                                                            environment =
                                                                                                                { string , target , ... } :
                                                                                                                    [
                                                                                                                        ( string "BASENAME" "${ pkgs.coreutils }/bin/basename" )
                                                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                        ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                                                                        ( string "SED" "${ pkgs.gnused }/bin/sed" )
                                                                                                                        ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                                                                        ( target { name = "e38a081823542c636b63a4aa3438db18fcf513e988ea7640503208f0d94252ff57a51ed0c931c4448d4b3396bfee7ce89e5c317d223e8bfd2ee4123eaf4ad1c6" ; } )
                                                                                                                    ] ;
                                                                                                        } ;
                                                                                            } ;
                                                                                } ;
                                                                        } ;
                                                            } ;
                                                        in
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources.foobar.temporary.a4374430e2a3ace64473d4c54891829ec96b4bfcd6ed6688d30cc4ff486b13dd9366bd4cb808d30c97471e99f200c605b28e7a4b7211834492d4f361c05b41c5 } &&
                                                                    exit 68
                                                            '' ;
                                                name = "temporary-checks" ;
                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                src = ./. ;
                                            } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}