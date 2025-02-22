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
                                                        resources =
                                                            {
                                                                idea = { } ;
                                                                observe = { } ;
                                                                util = { } ;
                                                            } ;
                                                        resources.old =
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
                                                                                        invoke =
                                                                                            { script , write-shell-script , ... } :
                                                                                                {
                                                                                                    init =
                                                                                                        script
                                                                                                            {
                                                                                                                executable = write-shell-script ( builtins.concatStringsSep " &&\n" resources.temporary.observe ) ;
                                                                                                            } ;
                                                                                                } ;
                                                                                        observe =
                                                                                            let
                                                                                                list =
                                                                                                    let
                                                                                                        list =
                                                                                                            let
                                                                                                                list = load "/observe.nix" { elemAt = builtins.elemAt ; } ;
                                                                                                                mapper =
                                                                                                                    {
                                                                                                                        arguments ? builtins.hashString "sha512" "arguments" ,
                                                                                                                        command ,
                                                                                                                        input-file ? builtins.hashString "sha512" "input-file" ,
                                                                                                                        input-pipe ? builtins.hashString "sha512" "input-pipe" ,
                                                                                                                        paste ? builtins.hashString "sha512" paste ,
                                                                                                                        status ? true
                                                                                                                    } :
                                                                                                                        {
                                                                                                                            arguments = arguments ;
                                                                                                                            command = command ;
                                                                                                                            handles = if status then 40 else 8 ;
                                                                                                                            input-file = input-file ;
                                                                                                                            input-pipe = input-pipe ;
                                                                                                                            paste = paste ;
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
                                                                                                    value : { derivation , harvest , resource , script , store , target , write-shell-script , ... } :
                                                                                                        {
                                                                                                            init =
                                                                                                                script
                                                                                                                    {
                                                                                                                        executable =
                                                                                                                            let
                                                                                                                                mapper =
                                                                                                                                    { arguments , command , handles , input-file , input-pipe , paste , status } @primary :
                                                                                                                                        if status then
                                                                                                                                            [
                                                                                                                                                "if ! ${ command ( harvest { } ) } ${ arguments } ; then ${ pkgs.coreutils }/bin/false ; fi # ${ builtins.toJSON status }"
                                                                                                                                            ]
                                                                                                                                        else
                                                                                                                                            [
                                                                                                                                                "if ${ command ( harvest { } ) } ${ arguments } ; then ${ pkgs.coreutils }/bin/false ; fi # ${ builtins.toJSON status }"
                                                                                                                                                "# ${ pkgs.coreutils }/bin/true"
                                                                                                                                            ] ;
                                                                                                                                    in write-shell-script ( builtins.concatStringsSep " &&\n" ( builtins.concatLists ( builtins.map mapper value.list ) ) ) ;
                                                                                                                                sets =
                                                                                                                                    [
                                                                                                                                        ( store { } )
                                                                                                                                        ( target { } )
                                                                                                                                        ( resource { } )
                                                                                                                                    ] ;
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
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
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
                    in flake-utils.lib.eachDefaultSystem fun ;
}
