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
                                                                                    else throw_new { name = name ; path = path ; reason = "identity" ; thing = "init" ; valid = [ "lambda" "null" ] ; value = value ; } ;
                                                                                post =
                                                                                    if builtins.typeOf post == "lambda" then post
                                                                                    else if builtins.typeOf post == "null" then builtins.null
                                                                                    else throw_new { name = name ; path = path ; reason = "identity" ; thing = "post" ; valid = [ "lambda" "null" ] ; value = value ; } ;
                                                                                release =
                                                                                    if builtins.typeOf release == "lambda" then release
                                                                                    else if builtins.typeOf release == "null" then builtins.null
                                                                                    else throw_new { name = name ; path = path ; reason = "identity" ; thing = "release" ; valid = [ "lambda" "null" ] ; value = value ; } ;
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
                                                                                                else throw_new { name = name ; path = path ; reason = "harvest" ; thing = "derivation" ; valid = [ "string" "set" ] ; value = value ; } ;
                                                                                         name-to-be-set = name ;
                                                                                        set = builtins.mapAttrs ( mapper [ ] ) ( harvest "$out" ) ;
                                                                                        in fun set ;
                                                                            grandparent-pid = { name ? "GRANDPARENT_PID" } : "--run export ${ name }=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                                                                            is-file = { name ? "IS_FILE" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ) ; fi'" ;
                                                                            is-pipe = { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ) ; fi'" ;
                                                                            path = name : index : "--set ${ name } ${ builtins.elemAt path index }" ;
                                                                            parent-pid = parent-pid pkgs ;
                                                                            resource = { name ? "RESOURCE" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                                            script = script ;
                                                                            shell-script = url : pkgs.writeShellScript "shell-script" ( builtins.readFile ( self + url ) ) ;
                                                                            standard-input = name : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo )'" ;
                                                                            string = name : value : "--set ${ name } ${ value }" ;
                                                                            target = { name ? "TARGET" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/target'" ;
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
                                                                                                            "${ resolve path name }/${ binary }"
                                                                                                        ]
                                                                                                    else builtins.throw "The executable is not a set but a ${ builtins.typeOf executable }."
                                                                                                )
                                                                                                (
                                                                                                    let
                                                                                                        in
                                                                                                            if builtins.typeOf sets == "list" then sets
                                                                                                            else throw_new { name = name ; path = path ; reason = "injection" ; thing = "sets" ; valid = [ "lists of strings" ] ; value = value ; }
                                                                                                )
                                                                                            ]
                                                                                    ) ;
                                                                    in ignore : identity ( value inject )
                                                                    ;
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
                                                                                    x = mapper p n v ;
                                                                                    in mapper p n v ;
                                                                        in builtins.genList generator ( builtins.length value )
                                                                else if builtins.typeOf value == "null" then lambda path name ( script : { } )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                else throw_new { name = name ; path = path ; reason = "sourcing" ; thing = "temporary" ; valid = [ "lambda" "list" "null" "set" ] ; value = value ; } ;
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
                                                                                    #    "if [ ! -d ${ resolve_old path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ resolve_old path } ; fi"
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
                                                                                        "makeWrapper ${ resolve path name }/setup.sh ${ resolve path name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo --set GREP ${ pkgs.gnugrep }/bin/grep --set INIT ${ resolve path name }/init.sh  --set INITIALIZATION_ERROR_STANDARD_ERROR ${ builtins.toString temporary-initialization-error-standard-error } --set INITIALIZATION_ERROR_INITIALIZER ${ builtins.toString temporary-initialization-error-initializer } --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ resolve path name }/release.sh ${ parent-pid pkgs { } } --set POST ${ resolve path name }/post.sh --set TAIL ${ pkgs.coreutils }/bin/tail --set TEARDOWN_ASYNCH ${ resolve path name }/teardown-asynch --set TEARDOWN_SYNCH ${ resolve path name }/teardown-synch --set TEE ${ pkgs.coreutils }/bin/tee --set TEMPORARY_RESOURCE_MASK ${ temporary-resource-mask }"
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
                                                                                # [
                                                                                #     "if [ ! -d ${ resolve_old path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ resolve_old path } ; fi"
                                                                                # ]
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
                                                                                # [
                                                                                #     "if [ ! -d ${ resolve_old path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ resolve_old path } ; fi"
                                                                                # ]
                                                                                ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                            ]
                                                                    else throw_new { name = name ; path = path ; reason = "construction" ; thing = "dependency" ; valid = [ "lambda" "list" "null" "set" ] ; value = value ; } ;
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
                                                            else throw_new { name = name ; path = path ; reason = "harvest" ; thing = "dependency" ; valid = [ "lambda" "list" "null" "set" ] ; value = value ; } ;
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
                                                        resources =
                                                            lib
                                                                {
                                                                    # at = "${ pkgs.at }/bin/at" ;
                                                                    temporary =
                                                                        {
                                                                            # temporary = idea ;
                                                                            inject =
                                                                                { script , ... } :
                                                                                    {

                                                                                    } ;
                                                                            null = builtins.null ;
                                                                            flist = [ builtins.null builtins.null ] ;
                                                                            super =
                                                                                { script , shell-script , string , target , ... } :
                                                                                    {
                                                                                        init =
                                                                                            script
                                                                                                {
                                                                                                    executable = shell-script "/scripts/test/util/super.sh" ;
                                                                                                    sets =
                                                                                                        [
                                                                                                            ( target { } )
                                                                                                            ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
                                                                                                        ] ;
                                                                                                } ;
                                                                                    } ;
                                                                        } ;
                                                                    # temporary-initialization-error = 65 ;
                                                                    # temporary-path = "ae67680146758d609c87886765e9778fba6b9f0bf565ccf48468833c46115a1e9a3faa641f437f5aea0c150c9030892c82d4648fdb6f4e744673c8ccf63e7e16" ;
                                                                    temporary-resource-mask = "checks.temporary.XXXXXXXX" ;
                                                                } ;
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
                                                                                    else throw_new { name = name ; path = path ; reason = "set" ; thing = "temporary" ; valid = [ "null" "set" ] ; value = value ; } ;
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
                                                                                                            else throw_new { name = name ; path = path ; reason = "initialization" ; thing = "idea" ; valid = [ "list" "set" ] ; value = value ; } ;
                                                                                                    in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) idea ) ) ;
                                                                                            mapper =
                                                                                                { index , init-status , seed } :
                                                                                                    let
                                                                                                        hash = string : builtins.substring [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ] [ "g" "h" "i" "j" "k" "l" "o" "p" ] ( builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" [ index init-status seed string ] ) ) ) ;
                                                                                                        in
                                                                                                            {
                                                                                                                command = builtins.concatStringsSep " . " [ "resource" "temporary" "temporary" "\"${ init-status }\"" "${ seed }" "\"${ index }\"" ] ;
                                                                                                                init-status = init-status ;
                                                                                                                files = if init-status == "0" then 40 else 8 ;
                                                                                                            } ;
                                                                                            in builtins.map mapper list ;
                                                                                    reducer =
                                                                                        previous : current :
                                                                                            let
                                                                                                last-group = if builtins.length previous == 0 then { commands = [ ] ; files = 0 ; } else builtins.head previous ;
                                                                                                rest-groups = if builtins.length previous == 0 then [ ] else builtins.tail previous ;
                                                                                                new-groups =
                                                                                                    if 3 * ( last-group.files + current.files ) < 1024 then builtins.concatLists [ [ { commands = builtins.concatLists [ last-group.commands [ current ] ] ; files = last-group.files + current.files ; } ] rest-groups ]
                                                                                                    else builtins.concatLists [ [ { commands = [ current ] ; files = current.files ; } ] previous ] ;
                                                                                                in new-groups ;
                                                                                    in builtins.foldl' reducer [ ] list ;
                                                                            mapper = value : "# ${ builtins.toJSON value }" ;
                                                                            in builtins.map mapper list ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "observe.sh" ( builtins.concatStringsSep " &&\n" list ) } $out &&
                                                                                ${ pkgs.coreutils }/bin/echo $out &&
                                                                                ${ pkgs.coreutils }/bin/echo ${ resources.temporary.inject } &&
                                                                                ${ pkgs.coreutils }/bin/echo ${ resources.temporary.null } &&
                                                                                ${ pkgs.coreutils }/bin/echo ${ resources.temporary.super } &&
                                                                                exit 66
                                                                        ''
                                                            else if builtins.pathExists ( self + "/expected.yaml" ) then
                                                                if builtins.pathExists ( self + "/observe.yaml" ) then
                                                                    if builtins.pathExists ( self + "/idea.nix" ) then
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/touch $out &&
                                                                                ${ pkgs.coreutils }/bin/echo FOUND ME >&2 &&
                                                                                exit 165
                                                                        ''
                                                                    else
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/touch $out &&
                                                                                ${ pkgs.coreutils }/bin/echo FOUND ME >&2 &&
                                                                                exit 16
                                                                        ''
                                                                else
                                                                    let

                                                                        in
                                                                            ''
                                                                                ${ pkgs.coreutils }/bin/touch $out &&
                                                                                    ${ pkgs.coreutils }/bin/echo FOUND ME >&2 &&
                                                                                    exit 167
                                                                    ''
                                                            else
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/touch $out
                                                                '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                    parent-pid = pkgs : { name ? "PARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                    resolve_old =
                        path :
                            let
                                mapper = value : if builtins.typeOf value == "int" || builtins.typeOf value == "string" then builtins.toJSON value else builtins.throw "The path index is neither int nor string." ;
                                in builtins.concatStringsSep "/" ( builtins.map mapper ( builtins.concatLists [ path ] ) ) ;
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
                    throw_new =
                        {
                            name ? builtins.null ,
                            path ,
                            reason ,
                            thing ,
                            valid ,
                            value
                        } :
                            let
                                complete-path = builtins.concatStringsSep " / " ( builtins.map builtins.toString ( builtins.concatLists [ path [ ( if builtins.typeOf name == "null" then [ ] else [ name ] ) ] ] ) ) ;
                                complete-invalid =
                                    let
                                        type = builtins.typeOf value ;
                                        in if type == "lambda" || type value == "list" || type value == "set" then type else "${ type }(${ builtins.substring 0 8 ( builtins.toString value ) })" ;
                                complete-valid =
                                    if builtins.length valid == 0 then builtins.throw "0 length valid does not make sense"
                                    else if builtins.length valid == 1 then "${ builtins.elemAt valid 0 }"
                                    else if builtins.length valid == 2 then "${ builtins.elemAt valid 0 } nor ${ builtins.elemeAt valid 1 }"
                                    else
                                        let
                                            head = builtins.elemAt valid ( ( builtins.length valid ) - 1 ) ;
                                            tail = builtins.genList ( index : builtins.elemAt valid index ) ( ( builtins.length valid ) - 1 ) ;
                                            in builtins.concatStringsSep ", " ( builtins.concatLists [ tail "nor" [ head ] ] ) ;
                                in
                                    builtins.throw "The ${ thing } defined (for ${ reason }) at ${ complete-path } is not ${ complete-valid } but ${ complete-invalid }." ;
                    in flake-utils.lib.eachDefaultSystem fun ;
}
