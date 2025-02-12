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
                                                    if builtins.pathExists ( self + "/expected.yaml" ) then
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
                                                            ''
                                                                ${ pkgs.coreutils }/bin/touch $out &&
                                                                    ${ pkgs.coreutils }/bin/echo FOUND ME >&2 &&
                                                                    exit 67
                                                            ''
                                                    else
                                                        let
                                                            list =
                                                                let
                                                                    levels =
                                                                        [
                                                                            { name = "init-status" ; value = [ false ] ; }
                                                                            { name = "init-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                            { name = "init-standard-output" ; value = [ true true ] ; }
                                                                            { name = "init-standard-error" ; value = [ true true ] ; }
                                                                            { name = "init-seed" ; value = [ true true ] ; }
                                                                            { name = "release-status" ; value = [ 0 71 72 ] ; }
                                                                            { name = "release-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                            { name = "release-standard-output" ; value = [ true true ] ; }
                                                                            { name = "release-standard-error" ; value = [ true true ] ; }
                                                                            { name = "release-seed" ; value = [ true true ] ; }
                                                                            { name = "seed" ; value = [ true true ] ; }
                                                                            { name = "speed" ; value = [ false ] ; }
                                                                        ] ;
                                                                    mapper =
                                                                        path : name : value :
                                                                            if builtins.typeOf value == "null" then
                                                                                let
                                                                                    init = [ "YES" ] ;
                                                                                        # if values.init-status == "0" then [ "YES" ] else [ "NO" ] ;
                                                                                    post = null ;
                                                                                    release = null ;
                                                                                    values =
                                                                                        let
                                                                                            generator = index : { name = builtins.elemAt levels index ; value = builtins.elemAt path index ; } ;
                                                                                            in builtins.genList generator ( builtins.length value ) ;
                                                                                    in
                                                                                        [
                                                                                            (
                                                                                                builtins.concatStringsSep
                                                                                                    "\n"
                                                                                                    (
                                                                                                        builtins.concatLists
                                                                                                            [
                                                                                                                [
                                                                                                                    "{ } :"
                                                                                                                    "\t{"
                                                                                                                    init
                                                                                                                    "\t}"
                                                                                                                ]
                                                                                                            ]
                                                                                                    )
                                                                                            )
                                                                                        ]
                                                                            else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
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
                                                                                                                        if builtins.typeOf level == "bool" && level then builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" ( builtins.map builtins.toString [ value.name index ] ) ) )
                                                                                                                        else if builtins.typeOf level == "bool" then value.name
                                                                                                                        else if builtins.typeOf level == "int" then builtins.toString level
                                                                                                                        else if builtins.typeOf level == "string" then level
                                                                                                                        else builtins.throw "The level ${ value.name } is neither a bool nor a string but a ${ builtins.typeOf level }" ;
                                                                                                        in builtins.genList generator ( builtins.length value.value ) ;
                                                                                            } ;
                                                                                    in builtins.map mapper list ;
                                                                            reducer =
                                                                                previous : current :
                                                                                    let
                                                                                        mapper = value : { name = value ; value = previous ; } ;
                                                                                        in builtins.listToAttrs ( builtins.map mapper current.value ) ;
                                                                            in builtins.foldl' reducer builtins.null list ;
                                                                    in builtins.mapAttrs ( mapper [ ] ) set ;
                                                            in
                                                                ''
                                                                    ${ pkgs.yq }/bin/yq --yaml-output . ${ builtins.toFile "json" ( builtins.toJSON list ) } > $out &&
                                                                        ${ pkgs.coreutils }/bin/echo FOUND ME $out >&2 &&
                                                                        exit 68
                                                                '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
