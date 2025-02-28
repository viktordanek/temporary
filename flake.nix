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
                                    temporary ? { } ,
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
                                                                            if type == "lambda" then [ ( lambda path elem ) ]
                                                                            else if type == "list" then builtins.concatLists ( list path elem )
                                                                            else if type == "set" then ( builtins.concatLists ( builtins.attrValues ( set path elem ) ) )
                                                                            else elem ;
                                                            lambda = path : value : builtins.getAttr "constuctors" ( value null ) ;
                                                            list =
                                                                path : value :
                                                                    builtins.concatLists
                                                                        [
                                                                            [
                                                                                "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "out" "temporary" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                            ]
                                                                            ( builtins.genList ( index : elem ( builtins.concatLists [ path [ index ] ] ) ( builtins.elemAt value index ) ) ( builtins.length value ) )
                                                                        ] ;
                                                            set =
                                                                path : value :
                                                                    builtins.concatLists
                                                                        [
                                                                            [
                                                                                "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" ( builtins.concatLists [ [ "out" "temporary" ] ( builtins.map builtins.toJSON path ) ] ) }"
                                                                            ]
                                                                            ( builtins.mapAttrs ( name : value : elem ( builtins.concatLists [ path [ name ] ] ) value ) value )
                                                                        ] ;
                                                            in builtins.concatStringsSep " &&\n" ( builtins.concatLists [ [ "${ pkgs.coreutils }/mkdir $out" ] ( elem [ ] dependencies ) ] ) ;
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
                                                    path : value : ignore :
                                                        let
                                                            constructors =
                                                                let
                                                                    executable =
                                                                        name : { environment , executable } :
                                                                            [
                                                                                "${ pkgs.coreutils }/bin/cat ${ executable } > ${ directory }/${ name }.sh"
                                                                                "${ pkgs.coreutils }/bin/chmod 0555 ${ director }/${ name }.sh"
                                                                                (
                                                                                    let
                                                                                        injection =
                                                                                            {
                                                                                                is-file = is-file ;
                                                                                                is-pipe = is-pipe ;
                                                                                                path = name : index : "--set ${ name } ${ builtins.toString ( builtins.elemAt ( builtins.concatLists [ path [ n ] ] ) index ) }" ;
                                                                                                string = name : value : "--set ${ name } ${ value }" ;
                                                                                                resource = { name ? "RESOURCE" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                                                                standard-input = { name ? "STANDARD_INPUT" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )'" ;
                                                                                                target = { name ? "TARGET" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/target'" ;
                                                                                                temporary = name : fun : "--set ${ name } ${ fun temporary_ }" ;
                                                                                            } ;
                                                                                        in "makeWrapper ${ directory }/${ name }.sh ${ directory }/${ name } ${ builtins.concatStringsSep " " ( environment injection ) }"
                                                                                )
                                                                            ] ;
                                                                    in
                                                                        [
                                                                            [
                                                                                "${ pkgs.coreutils }/bin/mkdir ${ directory }"
                                                                            ]
                                                                            ( executable "setup" setup )
                                                                            ( executable "teardown-asynch" teardown-asynch )
                                                                            ( executable "teardown-synch" teardown-synch )
                                                                            ( executable "init" point.init )
                                                                            ( executable "release" point.release )
                                                                            ( executable "post" point.post )
                                                                        ] ;
                                                            directory = builtins.concatStringsSep "/" ( builtins.concatLists [ [ "$out" "temporary" ] ( builtins.map builtins.toJSON path ) ] ) ;
                                                            identity =
                                                                { init ? null , post ? null , release ? null , tests ? [ ] , enable ? true } :
                                                                    {
                                                                        init = validate [ "lambda" "null" ] path init ;
                                                                        post = validate [ "lambda" "null" ] path post ;
                                                                        release = validate [ "lambda" "null" ] path release ;
                                                                        tests = validate [ "list" ] path tests ;
                                                                        enable = validate [ "bool" ] path tests ;
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
                                                                                ( string "INIT" "$out/init" )
                                                                                ( string "INITIALIZER" initializer )
                                                                                ( is-file { } )
                                                                                ( is-interactive { } )
                                                                                ( is-pipe { } )
                                                                                ( string "LN" "${ pkgs.coreutils }/bin/ln" )
                                                                                ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                ( parent-pid { } )
                                                                                ( string "POST" "$out/post" )
                                                                                ( string "RELEASE" "$out/release" )
                                                                                ( string "RESOURCE_MASK" "${ resource-mask }" )
                                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                ( string "STANDARD_ERROR" standard-error )
                                                                                ( string "TEARDOWN_ASYNCH" "$out/teardown-asynch" )
                                                                                ( string "TEARDOWN_SYNCH" "$out/teardown-synch" )
                                                                                ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                            ] ;
                                                                    executable = self + "/scripts/implementation/setup.sh" ;
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
                                                                                ( string "ECHO" "{ pkgs.coreutils }/bin/echo" )
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
                                                                        environment = environment injection ;
                                                                        executable = executable ;
                                                                    } ;
                                                            in
                                                                {
                                                                    constructors = constructors ;
                                                                    temporary =
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
                                                lambda = path : value : builtins.getAttr "temporary" ( value null ) ;
                                                list = path : value : builtins.genList ( index : elem ( builtins.concatLists [ path [ index ] ] ) ( builtins.elemAt value index ) ) ( builtins.length value ) ;
                                                set = path : value : builtins.mapAttrs ( name : value : elem ( builtins.concatLists [ path [ index ] ] ) value ) value ;
                                                in elem [ ] dependencies ;
                                        validate =
                                            valid : path : value :
                                                if builtins.any ( t : builtins.typeOf value == t ) value then value
                                                else builtins.throw "The value provided at ${ builtins.concatStringsSep " / " ( builtins.map builtins.toJSON path ) } is not ${ builtins.concatStringsSep " , " path } but ${ builtins.typeOf value }.  It is ${ if builtins.any ( t : builtins.type value == t ) [ "bool" "float" "int" "path" "string" ] then builtins.toJSON value else "unstringable" }." ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {

                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}