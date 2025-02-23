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
                                    temporary ? { } ,
                                    temporary-initialization-error-standard-error ? 64 ,
                                    temporary-initialization-error-initializer ? 65 ,
                                    temporary-path ? "ae67680146758d609c87886765e9778fba6b9f0bf565ccf48468833c46115a1e9a3faa641f437f5aea0c150c9030892c82d4648fdb6f4e744673c8ccf63e7e16" ,
                                    temporary-resource-mask ? "temporary.XXXXXXXX"
                                } :
                                    let
                                        dependencies =
                                            {
                                                temporary =
                                                    let
                                                        lambda =
                                                            path : name : value :
                                                                let
                                                                    identity =
                                                                        {
                                                                            init ? builtins.null ,
                                                                            post ? builtins.null ,
                                                                            release ? builtins.null
                                                                        } :
                                                                            {
                                                                                init =
                                                                                    if builtins.typeOf init == "lambda" then init
                                                                                    else if builtins.typeOf init == "null" then builtins.null
                                                                                    else throw path name value [ "lambda" "null" ] ;
                                                                                post =
                                                                                    if builtins.typeOf post == "lambda" then post
                                                                                    else if builtins.typeOf post == "null" then builtins.null
                                                                                    else throw path name value [ "lambda" "null" ] ;
                                                                                release =
                                                                                    if builtins.typeOf release == "lambda" then release
                                                                                    else if builtins.typeOf release == "null" then builtins.null
                                                                                    else throw path name value [ "lambda" "null" ] ;
                                                                            } ;
                                                                    inject =
                                                                        let
                                                                            out2 = "$( ${ pkgs.coreutils }/bin/dirname $( ${ pkgs.coreutils }/bin/dirname $( ${ pkgs.coreutils }/bin/readlink $( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/teardown-synch.sh ) ) )" ;
                                                                            out3 = "$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )" ;
                                                                            out = "$out" ;
                                                                            in
                                                                                {
                                                                                    derivation =
                                                                                        name : fun :
                                                                                            let
                                                                                                mapper =
                                                                                                    path : name : value :
                                                                                                        if builtins.typeOf value == "string" then "--set ${ name-to-be-set } ${ value }"
                                                                                                        else if builtins.typeOf value == "list" then
                                                                                                            let
                                                                                                                generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                                                                in builtins.genList generator ( builtins.length value )
                                                                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                                                        else throw path name value [ "list" "set" "string" ] ;
                                                                                                name-to-be-set = name ;
                                                                                                set = builtins.mapAttrs ( mapper [ ] ) ( harvest "$out" ) ;
                                                                                                in fun set ;
                                                                                    grandparent-pid = grandparent-pid pkgs ;
                                                                                    harvest = { name ? "STORE" } : harvest ( builtins.concatStringsSep "" [ "$" "{" name "}" ] ) ;
                                                                                    is-file = is-file pkgs ;
                                                                                    is-interactive = is-interactive pkgs ;
                                                                                    is-pipe = is-pipe pkgs ;
                                                                                    path = name : index : "--set ${ name } ${ builtins.elemAt path index }" ;
                                                                                    parent-pid = parent-pid pkgs ;
                                                                                    resource = { name ? "RESOURCE" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                                                    script = script ;
                                                                                    shell-script = url : self + url ;
                                                                                    standard-input = { name ? "STANDARD_INPUT" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )'" ;
                                                                                    store = { name ? "STORE" } : "--set ${ name } $out" ;
                                                                                    string = name : value : "--set ${ name } ${ value }" ;
                                                                                    target = { name ? "TARGET" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/target'" ;
                                                                                    write-shell-script = source : builtins.toString ( pkgs.writeShellScript "script.sh" source ) ;
                                                                                } ;
                                                                    script =
                                                                        {
                                                                            executable ,
                                                                            sets ? [ ]
                                                                        } :
                                                                            path : name : binary :
                                                                                builtins.concatStringsSep
                                                                                    " "
                                                                                    (
                                                                                        builtins.concatLists
                                                                                            [
                                                                                                (
                                                                                                    if builtins.typeOf executable == "string" then
                                                                                                        [
                                                                                                            "makeWrapper"
                                                                                                            ( pkgs.writeShellScript "executable" ( builtins.readFile executable ) )
                                                                                                            "${ resolve path name }/${ binary }"
                                                                                                        ]
                                                                                                    else throw path name value [ "string" ]
                                                                                                )
                                                                                                (
                                                                                                    let
                                                                                                        in
                                                                                                            if builtins.typeOf sets == "list" then sets
                                                                                                            else throw path name value [ "list" ]
                                                                                                )
                                                                                            ]
                                                                                    ) ;
                                                                    in ignore : identity ( value inject ) ;
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then lambda path name value
                                                                else if builtins.typeOf value == "list" then
                                                                    let
                                                                        generator =
                                                                            index :
                                                                                let
                                                                                    n = index ;
                                                                                    p = builtins.concatLists [ path [ name ] ] ;
                                                                                    v = builtins.elemAt value index ;
                                                                                    in mapper p n v ;
                                                                        in builtins.genList generator ( builtins.length value )
                                                                else if builtins.typeOf value == "null" then lambda path name ( script : { } )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                else throw path name value [ "null" "set" ] ;
                                                        in builtins.mapAttrs ( mapper [ "temporary" ] ) temporary ;
                                            } ;
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    name = "temporary-implementation" ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    src = ./. ;
                                                    installPhase =
                                                        let
                                                            mapper =
                                                                path : name : value :
                                                                    if builtins.typeOf value == "lambda" then
                                                                        let
                                                                            computed = value builtins.null ;
                                                                            in
                                                                                builtins.concatLists
                                                                                [
                                                                                    [
                                                                                        "source ${ builtins.concatStringsSep "" [ "$" "{" "MAKE_WRAPPER" "}" ] }/nix-support/setup-hook"
                                                                                    ]
                                                                                    [
                                                                                         "${ pkgs.coreutils }/bin/mkdir ${ resolve path name }"
                                                                                    ]
                                                                                    (
                                                                                        if computed.init == null then [ ]
                                                                                        else [ (  computed.init path name "init.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.release == null then [ ]
                                                                                        else [ ( computed.release path name "release.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.post == null then [ ]
                                                                                        else [ ( computed.post path name "post.sh" ) ]
                                                                                    )
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/setup.sh" } ${ resolve path name }/setup.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ resolve path name }/setup.sh"
                                                                                        "makeWrapper ${ resolve path name }/setup.sh ${ resolve path name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo ${ grandparent-pid pkgs { } } ${ is-file pkgs { } } ${ is-interactive pkgs { } } ${ is-pipe pkgs { } } --set GREP ${ pkgs.gnugrep }/bin/grep --set INIT ${ resolve path name }/init.sh  --set INITIALIZATION_ERROR_STANDARD_ERROR ${ builtins.toString temporary-initialization-error-standard-error } --set INITIALIZATION_ERROR_INITIALIZER ${ builtins.toString temporary-initialization-error-initializer } --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ resolve path name }/release.sh ${ parent-pid pkgs { } } --set POST ${ resolve path name }/post.sh --set RM ${ pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set TEARDOWN_ASYNCH ${ resolve path name }/teardown-asynch --set TEARDOWN_SYNCH ${ resolve path name }/teardown-synch --set TEE ${ pkgs.coreutils }/bin/tee --set TEMPORARY_RESOURCE_MASK ${ temporary-resource-mask }"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-asynch.sh" } ${ resolve path name }/teardown-asynch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ resolve path name }/teardown-asynch.sh"
                                                                                        "makeWrapper ${ resolve path name }/teardown-asynch.sh ${ resolve path name }/teardown-asynch --set AT ${ at } --set ECHO ${ pkgs.coreutils }/bin/echo --set NICE ${ pkgs.coreutils }/bin/nice --run 'export TEARDOWN_SYNCH=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/teardown-synch.sh'"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-synch.sh" } ${ resolve path name }/teardown-synch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ resolve path name }/teardown-synch.sh"
                                                                                        "makeWrapper ${ resolve path name }/teardown-synch.sh ${ resolve path name }/teardown-synch --set BASENAME ${ pkgs.coreutils }/bin/basename --set CHMOD ${pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock  --set MV ${pkgs.coreutils }/bin/mv --run 'export RESOURCE=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )' --set RM ${pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set TRUE ${ pkgs.coreutils }/bin/true"
                                                                                    ]
                                                                                ]
                                                                    else if builtins.typeOf value == "list" then
                                                                        builtins.concatLists
                                                                            [
                                                                                (
                                                                                    let
                                                                                       generator =
                                                                                           index :
                                                                                               let
                                                                                                   n = builtins.toString index ;
                                                                                                   p = builtins.concatLists [ path [ name ] ] ;
                                                                                                   v = builtins.elemAt value index ;
                                                                                                  in mapper p n v ;
                                                                                       in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                                )
                                                                            ]
                                                                    else if builtins.typeOf value == "set" then
                                                                        builtins.concatLists
                                                                            [
                                                                                ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                            ]
                                                                    else throw path name value [ "lambda" "list" "set" ] ;
                                                            in
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                        ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                        ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.buildPackages.makeWrapper } $out/bin/makeWrapper &&
                                                                        ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "constructor" ( builtins.concatStringsSep " &&\n " ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "$out" ] ) dependencies ) ) ) ) } $out/bin/constructor.sh &&
                                                                        makeWrapper $out/bin/constructor.sh $out/bin/constructor --set MAKE_WRAPPER $out/bin/makeWrapper &&
                                                                        $out/bin/constructor
                                                                '' ;
                                                } ;
                                        harvest =
                                            derivation :
                                                let
                                                    mapper =
                                                        path : name : value :
                                                            if builtins.typeOf value == "lambda" then "${ resolve path name}/setup"
                                                            else if builtins.typeOf value == "list" then
                                                                let
                                                                    generator =
                                                                        index :
                                                                            let
                                                                                n = builtins.toString index ;
                                                                                p = builtins.concatLists [ path [ name ] ] ;
                                                                                v = builtins.elemAt value index ;
                                                                                in mapper p n v ;
                                                                    in builtins.genList generator ( builtins.length value )
                                                            else if builtins.typeOf value == "null" then "${ resolve path name }/setup"
                                                            else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                            else throw path name value [ "null" "set" ] ;
                                                    in ( builtins.mapAttrs ( mapper [ derivation ] ) { temporary = temporary ; } ) ;
                                        in harvest ( builtins.toString derivation ) ;
                            pkgs = import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        pkgs.stdenv.mkDerivation
                                            {
                                                name = "temporary-test" ;
                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                src = ./. ;
                                                installPhase =
                                                    let
                                                        idea =
                                                            mapper :
                                                                let
                                                                    levels =
                                                                        [
                                                                            { name = "init-type" ; value = [ "lambda" "null" ] ; }
                                                                            { name = "init-standard-output" ; value = [ null ] ; }
                                                                            { name = "init-has-standard-error" ; value = [ true false ] ; }
                                                                            { name = "init-standard-error" ; value = [ null ] ; }
                                                                            { name = "init-status" ; value = [ 0 70 ] ; }
                                                                            { name = "init-temporary-paste" ; value = [ null ] ; }
                                                                            { name = "init-temporary-arguments" ; value = [ null ] ; }
                                                                            { name = "init-temporary-has-arguments" ; value = [ true false ] ; }
                                                                            { name = "init-temporary-pipe" ; value = [ null ] ; }
                                                                            { name = "init-temporary-has-pipe" ; value = [ true false ] ; }
                                                                            { name = "init-temporary-file" ; value = [ null ] ; }
                                                                            { name = "init-temporary-has-file" ; value = [ true false ] ; }
                                                                            { name = "init-temporary-status" ; value = [ 0 71 ] ; }
                                                                            { name = "release-type" ; value = [ "lambda" "null" ] ; }
                                                                            { name = "release-standard-output" ; value = [ null ] ; }
                                                                            { name = "release-has-standard-error" ; value = [ true false ] ; }
                                                                            { name = "release-standard-error" ; value = [ null ] ; }
                                                                            { name = "release-status" ; value = [ 0 73 ] ; }
                                                                            { name = "release-seed" ; value = [ null ] ; }
                                                                            { name = "release-temporary-paste" ; value = [ null ] ; }
                                                                            { name = "release-temporary-arguments" ; value = [ null ] ; }
                                                                            { name = "release-temporary-pipe" ; value = [ null ] ; }
                                                                            { name = "release-temporary-has-pipe" ; value = [ true false ] ; }
                                                                            { name = "release-temporary-file" ; value = [ null ] ; }
                                                                            { name = "release-temporary-has-file" ; value = [ true false ] ; }
                                                                            { name = "post-type" ; value = [ "null" ] ; }
                                                                            { name = "post-standard-output" ; value = [ null ] ; }
                                                                            { name = "post-has-standard-error" ; value = [ true false ] ; }
                                                                            { name = "post-standard-error" ; value = [ null ] ; }
                                                                            { name = "post-status" ; value = [ 0 76 ] ; }
                                                                            { name = "path-seed" ; value = [ null ] ; }
                                                                            { name = "speed" ; value = [ "slow" "fast" ] ; }
                                                                        ] ;
                                                                    list =
                                                                        let
                                                                            list =
                                                                                let
                                                                                    list =
                                                                                        let
                                                                                            mapper =
                                                                                                { name , value } :
                                                                                                    {
                                                                                                        name = name ;
                                                                                                        value =
                                                                                                            let
                                                                                                                generator =
                                                                                                                    index :
                                                                                                                        let
                                                                                                                            elem = builtins.elemAt value index ;
                                                                                                                            type = builtins.typeOf elem ;
                                                                                                                            in
                                                                                                                                if type == "bool" then elem
                                                                                                                                else if type == "int" then elem
                                                                                                                                else if type == "null" then builtins.hashString "sha512" ( builtins.concatStringsSep "" [ name ( builtins.toString index ) ] )
                                                                                                                                else if type == "string" then elem
                                                                                                                                else builtins.throw "Configuration Error:  The ${ builtins.toString index } level of ${ name } is not bool, int, null, nor string but ${ type }." ;
                                                                                                                in builtins.genList generator ( builtins.length value ) ;
                                                                                                    } ;
                                                                                            in builtins.map mapper levels ;
                                                                                    reducer =
                                                                                        previous : current :
                                                                                            builtins.concatLists
                                                                                                (
                                                                                                    builtins.map
                                                                                                        (
                                                                                                            value :
                                                                                                                builtins.map ( entry : builtins.concatLists [ entry [ { name = current.name; value = value; } ] ] ) previous
                                                                                                        )
                                                                                                    current.value
                                                                                                ) ;
                                                                                    in builtins.foldl' reducer [ [ ] ] list ;
                                                                            in list ;
                                                                    in builtins.map builtins.listToAttrs list ;
                                                        resources =
                                                            {
                                                                idea =
                                                                    lib
                                                                        {
                                                                            at = "/run/wrappers/bin/at" ;
                                                                            temporary =
                                                                                {
                                                                                    candidates =
                                                                                        let
                                                                                            list =
                                                                                                let
                                                                                                    mapper =
                                                                                                        {
                                                                                                            init-type ,
                                                                                                            init-standard-output ,
                                                                                                            init-has-standard-error ,
                                                                                                            init-standard-error ,
                                                                                                            init-status ,
                                                                                                            init-temporary-paste ,
                                                                                                            init-temporary-arguments ,
                                                                                                            init-temporary-has-arguments ,
                                                                                                            init-temporary-pipe ,
                                                                                                            init-temporary-has-pipe ,
                                                                                                            init-temporary-file ,
                                                                                                            init-temporary-has-file ,
                                                                                                            init-temporary-status ,
                                                                                                            path-seed ,
                                                                                                            ...
                                                                                                        } :
                                                                                                            { is-file , is-pipe , path , resource , script , shell-script , standard-input , string , target , ... } :
                                                                                                                {
                                                                                                                    init =
                                                                                                                        script
                                                                                                                            {
                                                                                                                                executable = shell-script "/scripts/test/temporary/executable.sh" ;
                                                                                                                                sets =
                                                                                                                                    [
                                                                                                                                        ( string "HAS_STANDARD_ERROR" ( builtins.toJSON init-has-standard-error ) )
                                                                                                                                        ( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
                                                                                                                                        ( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
                                                                                                                                        ( path "PATH_SEED" 0 )
                                                                                                                                        ( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ; } )
                                                                                                                                        ( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
                                                                                                                                        ( string "STANDARD_OUTPUT" init-standard-output )
                                                                                                                                        ( string "STANDARD_ERROR" init-standard-error )
                                                                                                                                        ( string "STATUS" ( builtins.toString init-status ) )
                                                                                                                                        ( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
                                                                                                                                        ( string "TEMPORARY_ARGUMENTS" init-temporary-arguments )
                                                                                                                                        ( string "TEMPORARY_FILE" ( builtins.toString ( builtins.writeFile "file" init-temporary-file ) ) )
                                                                                                                                        ( string "TEMPORARY_HAS_ARGUMENTS" ( builtins.toJSON init-temporary-has-arguments ) )
                                                                                                                                        ( string "TEMPORARY_HAS_FILE" ( builtins.toJSON init-temporary-has-file ) )
                                                                                                                                        ( string "TEMPORARY_HAS_PIPE" ( builtins.toJSON init-temporary-has-pipe ) )
                                                                                                                                        ( string "TEMPORARY_STATUS" ( builtins.toJSON init-temporary-status ) )
                                                                                                                                        ( string "TEMPORARY_PASTE" init-temporary-paste )
                                                                                                                                        ( string "TEMPORARY_PIPE" init-temporary-pipe )
                                                                                                                                    ] ;
                                                                                                                            } ;
                                                                                                                } ;
                                                                                                    in idea mapper ;
                                                                                            in list ;
                                                                                } ;
                                                                            temporary-initialization-error-standard-error = 66 ;
                                                                            temporary-initialization-error-initializer = 67 ;
                                                                            temporary-resource-mask = "temporary-66.XXXXXXXX" ;
                                                                        } ;
                                                                observe = { } ;
                                                                util = { } ;
                                                            } ;
                                                        in
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/echo $out &&
                                                                    ${ pkgs.coreutils }/bin/ln --symbolic ${ builtins.elemAt resources.temporary.candidates 0 } $out/candidate &&
                                                                    exit 64
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                    grandparent-pid = pkgs : { name ? "GRANDPARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                    is-file = pkgs : { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                    is-interactive = pkgs : { name ? "IS_INTERACTIVE" } : "--run 'export ${ name }=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                    is-pipe = pkgs : { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                    parent-pid = pkgs : { name ? "PARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                    resolution =
                        path : name :
                            let
                                list =
                                    let
                                        generator = index : builtins.elemAt path ( index + 1 ) ;
                                        in builtins.genList generator ( ( builtins.length path ) - 1 ) ;
                                mapper = value : if builtins.typeOf value == "int" || builtins.typeOf value == "string" then builtins.toJSON value else builtins.throw "The path index is neither int nor string." ;
                                in builtins.concatStringsSep "/" ( builtins.map mapper ( builtins.concatLists [ list [ name ] ] ) ) ;
                    resolve = path : name : "${ builtins.elemAt path 0 }/${ builtins.hashString "sha512" ( resolution path name ) }" ;
                    throw =
                        path : name : value : valid :
                            if builtins.any ( v : v == builtins.typeOf value ) valid then value
                            else builtins.throw "The value defined at ${ resolution path name } is not ${ builtins.concatStringsSep ", " valid } but ${ builtins.typeOf value }." ;
                    trace = x : builtins.trace ( builtins.toJSON x ) x ;
                    in flake-utils.lib.eachDefaultSystem fun ;
}
