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
                                                                        {
                                                                            derivation =
                                                                                name : fun :
                                                                                    let
                                                                                        mapper =
                                                                                            path : name : value :
                                                                                                if builtins.typeOf value == "string" then "--set ${ name-to-be-set } ${ value }"
                                                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                                                else throw path name value [ "string" "set" ] ;
                                                                                        name-to-be-set = name ;
                                                                                        set = builtins.mapAttrs ( mapper [ ] ) ( harvest "$out" ) ;
                                                                                        in fun set ;
                                                                            grandparent-pid = grandparent-pid pkgs ;
                                                                            harvest = harvest "$out" ;
                                                                            is-file = is-file pkgs ;
                                                                            is-interactive = is-interactive pkgs ;
                                                                            is-pipe = is-pipe pkgs ;
                                                                            path = name : index : "--set ${ name } ${ builtins.elemAt path index }" ;
                                                                            parent-pid = parent-pid pkgs ;
                                                                            resource = { name ? "RESOURCE" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                                            script = script ;
                                                                            shell-script = url : self + url ;
                                                                            standard-input = { name ? "STANDARD_INPUT" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )'" ;
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
                                                        resources =
                                                            lib
                                                                (
                                                                    let
                                                                        load = url : value : if builtins.pathExists ( self + url ) then builtins.import ( self + url ) value else [ ] ;
                                                                        in
                                                                            {
                                                                                # at = "${ pkgs.at }/bin/at" ;
                                                                                temporary =
                                                                                    {
                                                                                        idea = load "/idea.nix" { cat = "${ pkgs.coreutils }/bin/cat" ; cut = "${ pkgs.coreutils }/bin/cut" ; echo = "${ pkgs.coreutils }/bin/echo" ; find = "${ pkgs.findutils }/bin/find" ; flock = "${ pkgs.flock }/bin/flock" ; jq = "${ pkgs.jq }/bin/jq" ; mkdir = "${ pkgs.coreutils }/bin/mkdir" ; rm = "${ pkgs.coreutils }/bin/rm" ; sha512sum = "${ pkgs.coreutils }/bin/sha512sum" ; self = self ; yq = "${ pkgs.yq }/bin/yq" ; } ;
                                                                                        observe =
                                                                                            let
                                                                                                list =
                                                                                                    let
                                                                                                        list =
                                                                                                            let
                                                                                                                list = load "/observe.nix" { elemAt = builtins.elemAt ; } ;
                                                                                                                mapper =
                                                                                                                    {
                                                                                                                        command ,
                                                                                                                        status ? true
                                                                                                                    } :
                                                                                                                        {
                                                                                                                            command = command ;
                                                                                                                            handles = if status then 40 else 8 ;
                                                                                                                            status = status ;
                                                                                                                        } ;
                                                                                                                in builtins.map mapper list ;
                                                                                                        reducer =
                                                                                                            previous : current :
                                                                                                                let
                                                                                                                    new =
                                                                                                                        if 3 * ( current.handles + old.head.handles ) < 1024 then
                                                                                                                            {
                                                                                                                                head = { handles = current.handles + old.head.handles ; list = builtins.concatLists [ [ current ] old.head.list ] ; } ;
                                                                                                                                tail = old.tail ;
                                                                                                                            }
                                                                                                                        else
                                                                                                                            {
                                                                                                                                head = { handles = current.handles ; list = [ current ] ; } ;
                                                                                                                                tail = builtins.concatLists [ [ old.head ] old.tail ] ;
                                                                                                                            } ;
                                                                                                                    old =
                                                                                                                        if builtins.length previous == 0 then
                                                                                                                            {
                                                                                                                                head = { handles = 0 ; list = [ ] ; } ;
                                                                                                                                tail = [ ] ;
                                                                                                                            }
                                                                                                                        else
                                                                                                                            {
                                                                                                                                head = builtins.head previous ;
                                                                                                                                tail = builtins.tail previous ;
                                                                                                                            } ;
                                                                                                                    in builtins.concatLists [ [ new.head ] new.tail ] ;
                                                                                                        in builtins.foldl' reducer [ ] list ;
                                                                                                mapper =
                                                                                                    value : { derivation , harvest , script , target , write-shell-script , ... } :
                                                                                                        {
                                                                                                            init =
                                                                                                                script
                                                                                                                    {
                                                                                                                        executable =
                                                                                                                            let
                                                                                                                                mapper =
                                                                                                                                    { command , handles , status } :
                                                                                                                                        ''${ pkgs.coreutils }/bin/echo WTF=${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] } COMMAND=${ command harvest } > ${ builtins.concatStringsSep "" [ "$" "{" "TARGET" "}" ] }'' ;
                                                                                                                                    in write-shell-script ( builtins.concatStringsSep " &&\n" ( builtins.map mapper value.list ) ) ;
                                                                                                                                sets = [ ( target { } ) ( resource { } ) ] ;
                                                                                                                    } ;
                                                                                                        } ;
                                                                                                in builtins.map mapper list ;
                                                                                        util =
                                                                                            {
                                                                                                post =
                                                                                                    { script , shell-script , string , target , ... } :
                                                                                                        {
                                                                                                            init =
                                                                                                                script
                                                                                                                    {
                                                                                                                        executable = shell-script "/scripts/test/util/post.sh" ;
                                                                                                                        sets =
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
                                                                                                token =
                                                                                                    { script , shell-script , standard-input , string , target , ... } :
                                                                                                        {
                                                                                                            init =
                                                                                                                script
                                                                                                                    {
                                                                                                                        executable = shell-script "/scripts/test/util/token.sh" ;
                                                                                                                        sets =
                                                                                                                            [
                                                                                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                                ( standard-input { } )
                                                                                                                                ( target { } )
                                                                                                                            ] ;
                                                                                                                    } ;
                                                                                                        } ;
                                                                                           } ;
                                                                                    } ;
                                                                                # temporary-initialization-error = 65 ;
                                                                                # temporary-path = "ae67680146758d609c87886765e9778fba6b9f0bf565ccf48468833c46115a1e9a3faa641f437f5aea0c150c9030892c82d4648fdb6f4e744673c8ccf63e7e16" ;
                                                                                temporary-resource-mask = "checks.temporary.XXXXXXXX" ;
                                                                            }
                                                                ) ;
                                                        in
                                                            if ! builtins.pathExists ( self + "/idea.nix" ) then
                                                                let
                                                                    indent = n : builtins.concatStringsSep "" ( builtins.genList ( index : "\t" ) n ) ;
                                                                    list =
                                                                        let
                                                                            levels =
                                                                                [
                                                                                    { name = "init-status" ; value = [ 0 69 ] ; }
                                                                                    { name = "init-has-standard-error" ; value = [ true false ] ; }
                                                                                    { name = "path-seed" ; value = [ null ] ; }
                                                                                    { name = "init-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                                    { name = "init-standard-output" ; value = [ null ] ; }
                                                                                    { name = "init-standard-error" ; value = [ null ] ; }
                                                                                    { name = "init-seed" ; value = [ null ] ; }
                                                                                    { name = "release-status" ; value = [ 0 71 ] ; }
                                                                                    { name = "release-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                                    { name = "release-standard-output" ; value = [ null ] ; }
                                                                                    { name = "release-standard-error" ; value = [ null ] ; }
                                                                                    { name = "release-seed" ; value = [ null ] ; }   
                                                                                    { name = "post-status" ; value = [ 72 ] ; }
                                                                                    { name = "post-standard-output" ; value = [ null ] ; }
                                                                                    { name = "post-standard-error" ; value = [ null ] ; }
                                                                                    { name = "speed" ; value = [ "fast" "slow" ] ; }
                                                                                ] ;
                                                                            mapper =
                                                                                path : name : value :
                                                                                    if builtins.typeOf value == "null" then
                                                                                        let
                                                                                            escape = value : builtins.concatStringsSep "" [ "$" "{" " " value " " "}" ] ;
                                                                                            init =
                                                                                                if values.init-status == "0"
                                                                                                then
                                                                                                    [
                                                                                                        "init ="
                                                                                                        "${ indent 1 }script"
                                                                                                        "${ indent 2 }{"
                                                                                                        "${ indent 3 }executable = shell-script \"/scripts/test/temporary/init.sh\" ;"
                                                                                                        "${ indent 3 }sets ="
                                                                                                        "${ indent 4 }["
                                                                                                        "${ indent 5 }( string \"CAT\" \"${ escape "cat" }\" )"
                                                                                                        "${ indent 5 }( string \"FIND\" \"${ escape "find" }\" )"
                                                                                                        "${ indent 5 }( string \"HAS_STANDARD_ERROR\" \"${ values.init-has-standard-error }\" )"
                                                                                                        "${ indent 5 }( is-file { name = \"cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809\" ; } )"
                                                                                                        "${ indent 5 }( is-pipe { name = \"bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579\" ; } )"
                                                                                                        "${ indent 5 }( string \"JQ\" \"${ escape "jq" }\" )"
                                                                                                        "${ indent 5 }( path \"PATH_SEED\" 1 )"
                                                                                                        "${ indent 5 }( resource { name = \"c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306\" ;} )"
                                                                                                        "${ indent 5 }( string \"SEED\" \"${ values.init-seed }\" )"
                                                                                                        "${ indent 5 }( string \"SPEED\" \"${ values.speed }\" )"
                                                                                                        "${ indent 5 }( path \"STATUS\" 0 )"
                                                                                                        "${ indent 5 }( string \"STANDARD_ERROR\" \"${ values.init-standard-error }\" )"
                                                                                                        "${ indent 5 }( standard-input { name = \"d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64\" ; } )"
                                                                                                        "${ indent 5 }( string \"STANDARD_OUTPUT\" \"${ values.init-standard-output }\" )"
                                                                                                        "${ indent 5 }( string \"STATUS\" \"${ values.init-status }\" )"
                                                                                                        "${ indent 5 }( target { name = \"d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e\" ; } )"
                                                                                                        "${ indent 5 }( string \"TEMPLATE_FILE\" \"${ self + "/scripts/test/temporary/init.json" }\" )"
                                                                                                        "${ indent 5 }( derivation \"TEMPORARY_TOKEN\" ( harvest : harvest.temporary.util.token ) )"
                                                                                                        "${ indent 5 }( string \"YQ\" \"${ escape "yq" }\" )"
                                                                                                        "${ indent 4 }] ;"
                                                                                                        "${ indent 2 }} ;"
                                                                                                    ]
                                                                                                else [ ] ;
                                                                                            post =
                                                                                                [
                                                                                                    "post ="
                                                                                                    "${ indent 1 }script"
                                                                                                    "${ indent 2 }{"
                                                                                                    "${ indent 3 }executable = shell-script \"/scripts/test/temporary/post.sh\" ;"
                                                                                                    "${ indent 3 }sets ="
                                                                                                    "${ indent 4 }["
                                                                                                    "${ indent 5 }( string \"CAT\" \"${ escape "cat" }\" )"
                                                                                                    "${ indent 5 }( string \"CUT\" \"${ escape "cut" }\" )"
                                                                                                    "${ indent 5 }( string \"ECHO\" \"${ escape "echo" }\" )"
                                                                                                    "${ indent 5 }( string \"FLOCK\" \"${ escape "echo" }\" )"
                                                                                                    "${ indent 5 }( string \"MKDIR\" \"${ escape "mkdir" }\" )"
                                                                                                    "${ indent 5 }( path \"PATH_SEED\" 1 )"
                                                                                                    "${ indent 5 }( derivation \"POST\" ( harvest : harvest.temporary.util.post ) )"
                                                                                                    "${ indent 5 }( resource { name = \"d099a4dd4385e0153b002087fb77aad8469edfe0b3f693249cbef7735bab86906062a7303a3795ccaece5d16509e046d13afb9b8603831562d2e30a98b5177d3\" ;} )"
                                                                                                    "${ indent 5 }( string \"RM\" \"${ escape "rm" }\" )"
                                                                                                    "${ indent 5 }( string \"SHA512SUM\" \"${ escape "sha512sum" }\" )"
                                                                                                    "${ indent 5 }( string \"STANDARD_ERROR\" \"${ values.post-standard-error }\" )"
                                                                                                    "${ indent 5 }( string \"STANDARD_OUTPUT\" \"${ values.post-standard-output }\" )"
                                                                                                    "${ indent 5 }( string \"STATUS\" \"${ values.post-status }\" )"
                                                                                                    "${ indent 5 }( string \"YQ\" \"${ escape "yq" }\" )"
                                                                                                    "${ indent 4 }] ;"
                                                                                                    "${ indent 2 }} ;"
                                                                                                ] ;
                                                                                            release =
                                                                                                if values.release-status == "0"
                                                                                                then
                                                                                                    [
                                                                                                        "release ="
                                                                                                        "${ indent 1 }script"
                                                                                                        "${ indent 2 }{"
                                                                                                        "${ indent 3 }executable = shell-script \"/scripts/test/temporary/release.sh\" ;"
                                                                                                        "${ indent 3 }sets ="
                                                                                                        "${ indent 4 }["
                                                                                                        "${ indent 5 }( is-file { name = \"c94cc50e68897052d0c3496bc4dcbdecedc3459f11b3facb0693b40a7da93a02f3276e61cdacb75535e7cdfca0d65ccf1c63c52479d08b670cae60bb5c0d5516\" ; } )"
                                                                                                        "${ indent 5 }( is-pipe { name = \"abfa22b5c094b408b582a04b7b59dab7c858677c4c3f0da491321737b7e7776106bd49233988e8039ac733510a01bdfa7f576d21e40ed6cb76103c5a8f3a15d5\" ; } )"
                                                                                                        "${ indent 5 }( string \"JQ\" \"${ escape "jq" }\" )"
                                                                                                        "${ indent 5 }( path \"PATH_SEED\" 1 )"
                                                                                                        "${ indent 5 }( resource { name = \"b31762880353ee80704c43e129281f4b08787b8cec6de0e308b2d65ff9800606658e88e8848b94b6602fdfff552b6ae587ab48de59c00587d730f26bbe333df6\" ; } )"
                                                                                                        "${ indent 5 }( string \"SEED\" \"${ values.release-seed }\" )"
                                                                                                        "${ indent 5 }( string \"SPEED\" \"${ values.speed }\" )"
                                                                                                        "${ indent 5 }( path \"STATUS\" 0 )"
                                                                                                        "${ indent 5 }( string \"STANDARD_ERROR\" \"${ values.release-standard-error }\" )"
                                                                                                        "${ indent 5 }( standard-input { name = \"fb4458f0a23faca09364d9f8ea591ce44cac9d7fbf1ac94e06c12f607470dccf7d250f9ecef6b1db9168b43f0cded093ee95315ca4790cb99a981ad9cec5df02\" ; } )"
                                                                                                        "${ indent 5 }( string \"STANDARD_OUTPUT\" \"${ values.release-standard-output }\" )"
                                                                                                        "${ indent 5 }( string \"STATUS\" \"${ values.release-status }\" )"
                                                                                                        "${ indent 5 }( target { name = \"a64d58c7d5926109c9ae430e008b089ac989d57d28e564984a876de3c6014ec1e30f399611af2635e695978e79b960359c0158c2a9a269d9907b5ceeea11b871\" ; } )"
                                                                                                        "${ indent 5 }( string \"TEMPLATE_FILE\" \"${ self + "/scripts/test/temporary/release.json" }\" )"
                                                                                                        "${ indent 5 }( derivation \"TEMPORARY_TOKEN\" ( harvest : harvest.temporary.util.token ) )"
                                                                                                        "${ indent 5 }( string \"YQ\" \"${ escape "yq" }\" )"
                                                                                                        "${ indent 4 }] ;"
                                                                                                        "${ indent 2 }} ;"
                                                                                                    ]
                                                                                                else [ ] ;
                                                                                            values =
                                                                                                let
                                                                                                    generator = index : { name = builtins.getAttr "name" ( builtins.elemAt levels index ) ; value = builtins.elemAt ( builtins.concatLists [ path [ name ] ] ) index ; } ;
                                                                                                    in builtins.listToAttrs ( builtins.genList generator ( builtins.length levels ) ) ;
                                                                                            in
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        [
                                                                                                            "("
                                                                                                            "${ indent 1 }{ derivation , grandparent-pid , harvest , is-file , is-interactive , is-pipe , path , parent-pid , resource , script , shell-script , standard-input , string , target , write-shell-script } :"
                                                                                                            "${ indent 2 }{"
                                                                                                        ]
                                                                                                        ( builtins.map ( x : "${ indent 3 }${ x }" ) ( builtins.concatLists [ init post release ] ) )
                                                                                                        [
                                                                                                            "${ indent 2 }}"
                                                                                                            ")"
                                                                                                        ]
                                                                                                    ]
                                                                                    else if builtins.typeOf value == "set" then
                                                                                        let
                                                                                            divider = if builtins.length path < split then { open = "{" ; close = "}" ; } else { open = "[" ; close = "]" ; } ;
                                                                                            list = builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) ;
                                                                                            recurse =
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        [
                                                                                                            "\"${ name }\" ="
                                                                                                            "${ indent 1 }${ divider.open }"
                                                                                                        ]
                                                                                                        ( builtins.map ( value : "${ indent 2 }${ value }" ) list )
                                                                                                        [
                                                                                                            "${ indent 1 }${ divider.close } ;"
                                                                                                        ]
                                                                                                    ] ;
                                                                                            split = 2 ;
                                                                                            in if builtins.length path <= split then recurse else list
                                                                                    else throw path name value [ "null" "set" ] ;
                                                                            set =
                                                                                let
                                                                                    list =
                                                                                        let
                                                                                            list =
                                                                                                let
                                                                                                    generator = index : builtins.elemAt list ( ( builtins.length list ) - index - 1 ) ;
                                                                                                    list = levels ;
                                                                                                    in builtins.genList generator ( builtins.length list ) ;
                                                                                            mapper =
                                                                                                value :
                                                                                                    {
                                                                                                        name = value.name ;
                                                                                                        value =
                                                                                                            let
                                                                                                                generator =
                                                                                                                    index :
                                                                                                                        let
                                                                                                                            level = builtins.elemAt value.value index ;
                                                                                                                            in
                                                                                                                                if builtins.typeOf level == "bool" then if level then "true" else "false"
                                                                                                                                else if builtins.typeOf level == "int" then builtins.toString level
                                                                                                                                else if builtins.typeOf level == "null" then builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.toString [ value.name index ] ) )
                                                                                                                                else if builtins.typeOf level == "string" then level
                                                                                                                                else builtins.throw "The level ${ value.name } is neither a null nor a string but a ${ builtins.typeOf level }" ;
                                                                                                                in builtins.genList generator ( builtins.length value.value ) ;
                                                                                                    } ;
                                                                                            in builtins.map mapper list ;
                                                                                    reducer =
                                                                                        previous : current :
                                                                                            let
                                                                                                mapper = value : { name = value ; value = previous ; } ;
                                                                                                in builtins.listToAttrs ( builtins.map mapper current.value ) ;
                                                                                    in builtins.foldl' reducer builtins.null list ;
                                                                            in
                                                                                ''
                                                                                    { cat , cut , echo , find , flock , jq , mkdir , rm , sha512sum , self , yq } :
                                                                                    ${ indent 1 }{
                                                                                    ${ indent 2 }${ builtins.concatStringsSep "\n${ indent 2 }" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) set ) ) ) }
                                                                                    ${ indent 1 }}
                                                                                '' ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ builtins.toFile "idea.nix" ( list ) } $out &&
                                                                                ${ pkgs.coreutils }/bin/echo idea.nix is absent >&2 &&
                                                                                ${ pkgs.coreutils }/bin/echo $out >&2 &&
                                                                                exit 65
                                                                        ''
                                                            else if ! builtins.pathExists ( self + "/observe.nix" ) then
                                                                let
                                                                    file =
                                                                        let
                                                                            string =
                                                                                let
                                                                                    list =
                                                                                        let
                                                                                            mapper =
                                                                                                path : name : value :
                                                                                                    if builtins.typeOf value == "list" then
                                                                                                        let
                                                                                                            generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                                                            in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                                                    else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                                                    else if builtins.typeOf value == "string" then
                                                                                                        let
                                                                                                            status = if init-status == "0" && init-has-standard-error == "false" then true else false ;
                                                                                                            init-status = builtins.elemAt path 0 ;
                                                                                                            init-has-standard-error = builtins.elemAt path 1 ;
                                                                                                            seed = builtins.elemAt path 2 ;
                                                                                                            index = name ;
                                                                                                            command = builtins.concatStringsSep " . " ( builtins.map ( x : "\"${ x }\"" ) ( [ init-status init-has-standard-error seed ] ) ) ;
                                                                                                            in [ "\t\t{ command = harvest : elemAt harvest . temporary . idea . ${ command } ${ builtins.toString index } ; status = ${ builtins.toJSON status } ; }" ]
                                                                                                    else throw path name value [ "list" "set" "string" ] ;
                                                                                            in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) resources.temporary.idea ) ) ;
                                                                                    in builtins.concatStringsSep "\n" ( builtins.concatLists [ ["{  elemAt } :" "\t[" ] list [ "\t]" ] ] ) ;
                                                                            in builtins.toFile "observe.nix" string ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ file } $out &&
                                                                                ${ pkgs.coreutils }/bin/echo observe.nix is absent. >&2 &&
                                                                                ${ pkgs.coreutils }/bin/echo $out >&2 &&
                                                                                exit 34
                                                                        ''
                                                            else if ! builtins.pathExists ( self + "/expect.yaml" ) then
                                                                let
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/touch $out &&
                                                                                ${ pkgs.coreutils }/bin/echo ${ builtins.elemAt resources.temporary.observe 0 } &&
                                                                                exit 67
                                                                        ''
                                                            else
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/touch $out
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
                    in flake-utils.lib.eachDefaultSystem fun ;
}
