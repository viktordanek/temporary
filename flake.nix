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
                                    at ? "${ pkgs.at }/bin/at" ,
                                    temporary ? { } ,
                                    temporary-initialization-error ? 64 ,
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
                                                                                    else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf init }." ;
                                                                                post =
                                                                                    if builtins.typeOf post == "lambda" then post
                                                                                    else if builtins.typeOf post == "null" then builtins.null
                                                                                    else builtins.throw "The post defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf post }." ;
                                                                                release =
                                                                                    if builtins.typeOf release == "lambda" then release
                                                                                    else if builtins.typeOf release == "null" then builtins.null
                                                                                    else builtins.throw "The release defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf release }." ;
                                                                            } ;
                                                                    script =
                                                                        {
                                                                            executable ,
                                                                            sets ? { }
                                                                        } :
                                                                            path : name : binary :
                                                                                builtins.concatStringsSep
                                                                                    " "
                                                                                    (
                                                                                        builtins.concatLists
                                                                                            [
                                                                                                (
                                                                                                    if builtins.typeOf executable == "set" then
                                                                                                        [
                                                                                                            "makeWrapper"
                                                                                                            ( builtins.toString executable )
                                                                                                            "${ builtins.concatStringsSep "/" path }/${ name }/${ binary }"
                                                                                                        ]
                                                                                                    else builtins.throw "The executable is not a set but a ${ builtins.typeOf executable }"
                                                                                                )
                                                                                                (
                                                                                                    let
                                                                                                        inject =
                                                                                                            {
                                                                                                                derivation =
                                                                                                                    name : fun :
                                                                                                                        let
                                                                                                                            mapper =
                                                                                                                                path : name : value :
                                                                                                                                    if builtins.typeOf value == "string" then "--set ${ name-to-be-set } ${ value }"
                                                                                                                                    else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                                                                                    else builtins.throw "The harvest at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } is neither a string nor a set but a ${ builtins.typeOf value }." ;
                                                                                                                            name-to-be-set = name ;
                                                                                                                            set = builtins.mapAttrs ( mapper [ ] ) ( harvest "$out" ) ;
                                                                                                                            in fun set ;
                                                                                                                is-file = name : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ) ; fi'" ;
                                                                                                                is-pipe = name : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ) ; fi'" ;
                                                                                                                path = name : index : "--set ${ name } ${ builtins.elemAt path index }" ;
                                                                                                                resource = name : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                                                                                standard-input = name : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo )'" ;
                                                                                                                string = name : value : "--set ${ name } ${ value }" ;
                                                                                                                target = name : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/target'" ;
                                                                                                            } ;
                                                                                                        in
                                                                                                            if builtins.typeOf sets == "lambda" && builtins.typeOf ( sets inject ) == "list" then sets inject
                                                                                                            else builtins.throw "The sets at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } is a lambda of lists."
                                                                                                )
                                                                                            ]
                                                                                    ) ;
                                                                    in ignore : identity ( value script ) ;
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then lambda path name value
                                                                else if builtins.typeOf value == "null" then lambda path name { }
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda, null, nor a set but is a ${ builtins.typeOf value }." ;
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
                                                                                        "if [ ! -d ${ builtins.concatStringsSep "/" path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path } ; fi"
                                                                                        "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }/${ name }"
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
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/setup.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh ${ builtins.concatStringsSep "/" path }/${ name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo --set ERROR ${ builtins.toString temporary-initialization-error } --set GREP ${ pkgs.gnugrep }/bin/grep --set INIT ${ builtins.concatStringsSep "/" path }/${ name }/init.sh --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ builtins.concatStringsSep "/" path }/${ name }/release.sh --set POST ${ builtins.concatStringsSep "/" path }/${ name }/post.sh --set TAIL ${ pkgs.coreutils }/bin/tail --set TEARDOWN_ASYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch --set TEMPORARY_PATH ${ temporary-path } --set TEMPORARY_PATH_ARRAY ${ builtins.concatStringsSep "/" ( builtins.concatLists [ ( builtins.map ( n : builtins.elemAt path n ) ( builtins.filter ( n : n > 1 ) ( builtins.genList ( n : n ) ( builtins.length path ) ) ) ) [ name ] ] ) } --set TEE ${ pkgs.coreutils }/bin/tee --set TEMPORARY_RESOURCE_MASK ${ temporary-resource-mask }"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-asynch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set AT ${ at } --run 'export LOCAL_RESOURCE=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )' --set ECHO ${ pkgs.coreutils }/bin/echo --set NICE ${ pkgs.coreutils }/bin/nice  --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-synch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch --set BASENAME ${ pkgs.coreutils }/bin/basename --set CHMOD ${pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock  --set MV ${pkgs.coreutils }/bin/mv --set RM ${pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set TRUE ${ pkgs.coreutils }/bin/true --set CAT ${ pkgs.coreutils }/bin/cat"
                                                                                    ]
                                                                                ]
                                                                    else if builtins.typeOf value == "set" then
                                                                        builtins.concatLists
                                                                            [
                                                                                [
                                                                                    "if [ ! -d ${ builtins.concatStringsSep "/" path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path } ; fi"
                                                                                ]
                                                                                ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                            ]
                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
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
                                                            if builtins.typeOf value == "lambda" then "${ builtins.concatStringsSep "/" path }/${ name }/setup"
                                                            else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                            else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
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
                                                        idea = if builtins.pathExists ( self + "/idea.nix" ) then builtins.import ( self + "/idea.nix" ) { pkgs = pkgs ; self = self ; } else builtins.throw "idea.nix is not available" ;
                                                        observe = if builtins.pathExists ( self + "/observe.yaml" ) then builtins.throw "WTFA" else builtins.throw "WTFB" ;
                                                        in
                                                            if ! builtins.pathExists ( self + "/idea.nix" ) then
                                                                let
                                                                    indent = n : builtins.concatStringsSep "" ( builtins.genList ( index : "\t" ) n ) ;
                                                                    list =
                                                                        let
                                                                            levels =
                                                                                [
                                                                                    { name = "init-status" ; value = [ 0 69 70 ] ; }
                                                                                    { name = "seed" ; value = [ null null ] ; }
                                                                                    { name = "init-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                                    { name = "init-standard-output" ; value = [ null null ] ; }
                                                                                    { name = "init-standard-error" ; value = [ null null ] ; }
                                                                                    { name = "init-seed" ; value = [ null null ] ; }
                                                                                    { name = "release-status" ; value = [ 0 71 72 ] ; }
                                                                                    { name = "release-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                                    { name = "release-standard-output" ; value = [ null null ] ; }
                                                                                    { name = "release-standard-error" ; value = [ null null ] ; }
                                                                                    { name = "release-seed" ; value = [ null null ] ; }
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
                                                                                                        "${ indent 3 }executable = self + \"/scripts/test/temporary/init.sh\" ;"
                                                                                                        "${ indent 3 }sets ="
                                                                                                        "${ indent 4 }["
                                                                                                        "${ indent 5 }( derivation \"TEMPORARY_TOKEN\" ( harvest : harvest.temporary.util.token ) )"
                                                                                                        "${ indent 5 }( is-file \"IS_FILE\" )"
                                                                                                        "${ indent 5 }( is-pipe \"IS_PIPE\" )"
                                                                                                        "${ indent 5 }( path \"POST_SEED\" 1 )"
                                                                                                        "${ indent 5 }( resource \"RESOURCE\" )"
                                                                                                        "${ indent 5 }( string \"SEED\" \"${ values.init-seed }\" )"
                                                                                                        "${ indent 5 }( string \"SPEED\" \"${ values.speed }\" )"
                                                                                                        "${ indent 5 }( path \"STATUS\" 0 )"
                                                                                                        "${ indent 5 }( standard-input \"STANDARD_INPUT\" )"
                                                                                                        "${ indent 5 }( string \"STANDARD_ERROR\" \"${ values.init-standard-error }\" )"
                                                                                                        "${ indent 5 }( string \"STANDARD_OUTPUT\" \"${ values.init-standard-output }\" )"
                                                                                                        "${ indent 5 }( string \"STATUS\" \"${ values.init-status }\" )"
                                                                                                        "${ indent 5 }( target \"TARGET\" )"
                                                                                                        "${ indent 5 }( string \"YQ\" \"${ escape "pkgs.yq" }/bin/yq\" )"
                                                                                                        "${ indent 4 }] ;"
                                                                                                        "${ indent 2 }} ;"
                                                                                                    ]
                                                                                                else [ ] ;
                                                                                            post =
                                                                                                [
                                                                                                    "post ="
                                                                                                    "${ indent 1 }script"
                                                                                                    "${ indent 2 }{"
                                                                                                    "${ indent 3 }executable = self + \"/scripts/test/temporary/post.sh\" ;"
                                                                                                    "${ indent 3 }sets ="
                                                                                                    "${ indent 4 }["
                                                                                                    "${ indent 5 }( string \"YQ\" \"${ escape "pkgs.yq" }/bin/yq\" )"
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
                                                                                                        "${ indent 3 }executable = self + \"/scripts/test/temporary/release.sh\" ;"
                                                                                                        "${ indent 3 }sets ="
                                                                                                        "${ indent 4 }["
                                                                                                        "${ indent 5 }( derivation \"TEMPORARY_TOKEN\" ( harvest : harvest.temporary.util.token ) )"
                                                                                                        "${ indent 5 }( is-file \"IS_FILE\" )"
                                                                                                        "${ indent 5 }( is-pipe \"IS_PIPE\" )"
                                                                                                        "${ indent 5 }( path \"POST_SEED\" 0 )"
                                                                                                        "${ indent 5 }( resource \"RESOURCE\" )"
                                                                                                        "${ indent 5 }( string \"SEED\" \"${ values.release-seed }\" )"
                                                                                                        "${ indent 5 }( string \"SPEED\" \"${ values.speed }\" )"
                                                                                                        "${ indent 5 }( string \"STATUS\" \"${ values.release-status }\" )"
                                                                                                        "${ indent 5 }( standard-input \"STANDARD_INPUT\" )"
                                                                                                        "${ indent 5 }( string \"STANDARD_ERROR\" \"${ values.release-standard-error }\" )"
                                                                                                        "${ indent 5 }( string \"STANDARD_OUTPUT\" \"${ values.release-standard-output }\" )"
                                                                                                        "${ indent 5 }( string \"STATUS\" \"${ values.release-status }\" )"
                                                                                                        "${ indent 5 }( target \"TARGET\" )"
                                                                                                        "${ indent 5 }( string \"YQ\" \"${ escape "pkgs.yq" }/bin/yq\" )"
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
                                                                                                            "# ${ builtins.toJSON values }"
                                                                                                            "("
                                                                                                            "${ indent 1 }{ derivation , is-file , is-pipe , path , resource , script , standard-input , string , target } :"
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
                                                                                            divider = if builtins.length path < 1 then { open = "{" ; close = "}" ; } else { open = "[" ; close = "]" ; } ;
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
                                                                                            in if builtins.length path < 2 then recurse else list
                                                                                    else builtins.throw "The temporary at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } is neither a null nor a set but a ${ builtins.typeOf value }." ;
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
                                                                                                                                if builtins.typeOf level == "null" then builtins.replaceStrings [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ] [ "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" ] ( builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" ( builtins.map builtins.toString [ value.name index ] ) ) ) )
                                                                                                                                else if builtins.typeOf level == "int" then builtins.toString level
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
                                                                                    { pkgs , self } :
                                                                                    ${ indent 1 }{
                                                                                    ${ indent 2 }${ builtins.concatStringsSep "\n${ indent 2 }" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) set ) ) ) }
                                                                                    ${ indent 1 }}
                                                                                '' ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ builtins.toFile "idea.nix" ( list ) } $out &&
                                                                                ${ pkgs.coreutils }/bin/echo FOUND ME $out >&2 &&
                                                                                exit 65
                                                                        ''
                                                            else if ! builtins.pathExists ( self + "/observe.yaml" ) then
                                                                let
                                                                    list =
                                                                        let
                                                                            list =
                                                                                let
                                                                                    list =
                                                                                        let
                                                                                            list =
                                                                                                let
                                                                                                    mapper =
                                                                                                        path : name : value :
                                                                                                            if builtins.typeOf value == "list" then
                                                                                                                let
                                                                                                                    generator = index : { index = builtins.toString index ; init-status = builtins.elemAt path 0 ; seed = name ; } ;
                                                                                                                    in builtins.genList generator ( builtins.length value )
                                                                                                            else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                                                            else builtins.throw "The idea defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } is neither a list nor a set but a ${ builtins.typeOf value }." ;
                                                                                                    in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) idea ) ) ;
                                                                                            mapper =
                                                                                                { index , init-status , seed } :
                                                                                                    let
                                                                                                        hash = string : builtins.substring [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ] [ "g" "h" "i" "j" "k" "l" "o" "p" ] ( builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" [ index init-status seed string ] ) ) ) ;
                                                                                                        in
                                                                                                            {
                                                                                                                command = builtins.concatStringsSep " . " [ "resource" "temporary" "temporary" "\"${ init-status }\"" "${ seed }" "\"${ index }\"" ] ;
                                                                                                                files = 32 ;
                                                                                                            } ;
                                                                                            in builtins.map mapper list ;
                                                                                    reducer =
                                                                                        previous : current :
                                                                                            let
                                                                                                n = builtins.length previous ;
                                                                                                new-head = if current.files + old-head.files < 1024 then { commands = builtins.concatLists [ old-head.commands [ current.command ] ] ; files = current.files + old-head.files ; } else { commands = [ current.command ] ; files = current.files ; } ;
                                                                                                new-tail = if current.files + old-head.files < 1024 then old-tail else previous ;
                                                                                                old-head = if n > 0 then builtins.elemAt previous ( n - 1 ) else { commands = [ ] ; files = 0 ; } ;
                                                                                                old-tail =
                                                                                                    let
                                                                                                        generator = index : index < n - 1 ;
                                                                                                        in builtins.genList generator ( builtins.length previous ) ;
                                                                                                in builtins.trace "HI ${ builtins.concatStringsSep " ; " ( builtins.map builtins.toString ( builtins.map builtins.length [ old-head.files ] ) ) }" ( builtins.concatLists [ [ new-head ] new-tail ] )  ;
                                                                                    in builtins.foldl' reducer [ ] list ;
                                                                            mapper = value : "# ${ builtins.toJSON value }" ;
                                                                            in builtins.map mapper list ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "observe.sh" ( builtins.concatStringsSep " &&\n" list ) } $out &&
                                                                                ${ pkgs.coreutils }/bin/echo $out &&
                                                                                exit 66
                                                                        ''
                                                            else if builtins.pathExists ( self + "/expected.yaml" ) then
                                                                if builtins.pathExists ( self + "/observe.yaml" ) then
                                                                    if builtins.pathExists ( self + "/idea.nix" ) then
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/touch $out &&
                                                                                ${ pkgs.coreutils }/bin/echo FOUND ME >&2 &&
                                                                                exit 65
                                                                        ''
                                                                    else
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/touch $out &&
                                                                                ${ pkgs.coreutils }/bin/echo FOUND ME >&2 &&
                                                                                exit 66
                                                                        ''
                                                                else
                                                                    let

                                                                        in
                                                                            ''
                                                                                ${ pkgs.coreutils }/bin/touch $out &&
                                                                                    ${ pkgs.coreutils }/bin/echo FOUND ME >&2 &&
                                                                                    exit 67
                                                                    ''
                                                            else
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/touch $out
                                                                '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
