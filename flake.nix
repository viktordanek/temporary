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
                                                                                                                path = name : index : "--set ${ name } ${ builtins.elemAt path index }" ;
                                                                                                                resource = name : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
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
                                        let
                                            resources =
                                                let
                                                    temporary =
                                                        let
                                                            mapper =
                                                                path : name : value :
                                                                    if builtins.typeOf value == "null" then
                                                                        let
                                                                            in
                                                                            script :
                                                                                {
                                                                                    init =
                                                                                        script
                                                                                            {
                                                                                                executable = pkgs.writeScript "init" ( builtins.readFile ( self + "/scripts/test/temporary/init.sh" ) ) ;
                                                                                                sets =
                                                                                                    { path , string , target , ... } :
                                                                                                        [
                                                                                                            ( target "a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7" )
                                                                                                            ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                            ( string "KEY" "8c76c6c0ba84dad00a575e32b05d423d2ed903c87a284f647bf9c4db955373ae9f2124246ae21b008397be1a6419ec0aa93665dd58bdbb22dcdb2588b275edae" )
                                                                                                            ( path "STANDARD_ERROR" 9 )
                                                                                                            ( path "STANDARD_OUTPUT" 8 )
                                                                                                            ( path "STATUS" 10 )
                                                                                                            ( target "a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7" )
                                                                                                            ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                                                        ] ;
                                                                                            } ;
                                                                                    release =
                                                                                        script
                                                                                            {
                                                                                                executable = pkgs.writeScript "release" ( builtins.readFile ( self + "/scripts/test/temporary/release.sh" ) ) ;
                                                                                                sets =
                                                                                                    { string , target , ... } :
                                                                                                    [
                                                                                                        ( target "a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7" )
                                                                                                        ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                        ( string "KEY" "a7a76a56d9180ebebb831418d2e519865839cad327a67c2217ba66512fe2440c8187fa21d29cf5e653843c314581e945167b7798b3fb388e6dfe916eeaa6a7d9" )
                                                                                                        ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                                                    ] ;
                                                                                            } ;
                                                                                    post =
                                                                                        script
                                                                                            {
                                                                                                executable = pkgs.writeScript "post" ( builtins.readFile ( self + "/scripts/test/temporary/post.sh" ) ) ;
                                                                                                sets =
                                                                                                    { derivation , resource , string , ... } :
                                                                                                        [
                                                                                                            ( resource "f9f95f80b51f23cdd35e578c51c3a38054691c35f97ae77ef02dbb012c9f2edda745015cd3888a696e92dd8db698e8647c88bcb7fd4b4c738af6dd23298e237f" )
                                                                                                            ( string "DIFF " "${ pkgs.diffutils }/bin/diff" )
                                                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                            ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                                                            ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                                            ( string "KEY" "54eb53e19c8932b99e39e7be3bf77288a29241a7817772e28d9cc5e10bf3bef9fdb07f89113115219bb9afb50b14429f6a57a550d031efb08e3dd0a341abccec" )
                                                                                                            ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
                                                                                                            ( derivation "OBSERVED" ( harvest : harvest.temporary.util.post ) )
                                                                                                            ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                                            ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                                            ( string "WC" "${ pkgs.coreutils }/bin/wc" )
                                                                                                        ] ;
                                                                                            } ;
                                                                                    }
                                                                    else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                    else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a null nor a set but a ${ builtins.typeOf value }." ;
                                                            set =
                                                                let
                                                                    fields =
                                                                        [
                                                                            { name = "speed" ; lambda = [ "slow" ] ; }
                                                                            { name = "release-status" ; lambda = [ 0 101 ]  ; }
                                                                            { name = "release-standard-error" ; lambda = [ builtins.null ] ; }
                                                                            { name = "release-standard-output" ; lambda = [ builtins.null ] ; }
                                                                            { name = "release-typeOf" ; lambda = [ "lambda" "null" ] ; }
                                                                            { name = "init-status" ; lambda = [ 0 101 ] ; }
                                                                            { name = "init-standard-error" ; lambda = [ builtins.null ] ; }
                                                                            { name = "init-standard-output" ; lambda = [ builtins.null ] ; }
                                                                            { name = "init-typeOf" ; lambda = [ "lambda" "null" ] ; }
                                                                            { name = "standard-input" ; lambda = [ builtins.null builtins.null ] ; }
                                                                            { name = "has-standard-input" ; lambda = [ "interactive" "pipe" "file" ] ; }
                                                                            { name = "arguments" ; lambda = [ builtins.null ] ; }
                                                                            { name = "has-arguments" ; lambda = [ builtins.true builtins.false ] ; }
                                                                        ] ;
                                                                    reducer =
                                                                        previous : current :
                                                                            let
                                                                                generator =
                                                                                    index :
                                                                                        let
                                                                                            type = builtins.typeOf value ;
                                                                                            value = builtins.elemAt current.lambda index ;
                                                                                            in
                                                                                                {
                                                                                                    name =
                                                                                                        if builtins.typeOf value == "null" then builtins.replaceStrings [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ] [ "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" ] ( builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" ( builtins.map builtins.toString [ current.name index ] ) ) ) )
                                                                                                        else if builtins.typeOf value == "bool" && value then "true"
                                                                                                        else if builtins.typeOf value == "bool" then "false"
                                                                                                        else builtins.toString value ;
                                                                                                    value = previous ;
                                                                                                } ;
                                                                                list = builtins.genList generator ( builtins.length current.lambda ) ;
                                                                                in builtins.listToAttrs list ;
                                                                    in builtins.foldl' reducer builtins.null fields ;
                                                            in builtins.mapAttrs ( mapper [ ] ) set ;
                                                    in
                                                        lib
                                                            {
                                                                at =
                                                                    pkgs.writeShellScript
                                                                        "at"
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/cat | ${ pkgs.bash }/bin/bash &
                                                                        '' ;
                                                                temporary =
                                                                    {
                                                                        temporary = temporary ;
                                                                        util =
                                                                            {
                                                                                identity =
                                                                                    script :
                                                                                        {
                                                                                            init =
                                                                                                script
                                                                                                    {
                                                                                                        executable = pkgs.writeShellScript "expected" ( builtins.readFile ( self + "/scripts/test/util/identity.sh" ) ) ;
                                                                                                        sets =
                                                                                                            { string , target , ... } :
                                                                                                                [
                                                                                                                    ( target "a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7" )
                                                                                                                    ( string "CUT" "${ pkgs.coreutils }/bin/cut" )
                                                                                                                    ( string "KEY" "a8c2c5bb88ba35c9da8541534977bb474b6301ed25b51e4b2f66e262f7434a8fe1cfe9d4223c9cc41f91146e6060c1f4074f0a5d1f905d528e1bb7b1db51522b" )
                                                                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                    ( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
                                                                                                                ] ;
                                                                                                    } ;
                                                                                    } ;
                                                                                post =
                                                                                    script :
                                                                                        {
                                                                                            init =
                                                                                                script
                                                                                                    {
                                                                                                        executable = pkgs.writeShellScript "observed" ( builtins.readFile ( self + "/scripts/test/util/post.sh" ) ) ;
                                                                                                        sets =
                                                                                                            { string , target , ... } :
                                                                                                                [
                                                                                                                    ( target "a1bf1278edcdadde99ea528e6f7fb99c069e840bb2bc10f5e54326df380677e399d911352ba22cce94ad7817efae178bc5844b74b874d1ded5bca309f55d78a7" )
                                                                                                                    ( string "BASENAME" "${ pkgs.coreutils }/bin/basename" )
                                                                                                                    ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                                    ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                                                    ( string "KEY" "3bb579b9de6da284c19bd0c47b9e0c029e09a729d0a4f95e66e2e7557645d046eaedd0c29affde2a1bd2cc69575a70a4e5c45bd514046ae041129761d68cd923" )
                                                                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                    ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                                                                    ( string "SED" "${ pkgs.gnused }/bin/sed" )
                                                                                                                    ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                                                                                    ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                                                ] ;
                                                                                                    } ;
                                                                                        } ;
                                                                                token =
                                                                                    script :
                                                                                        {
                                                                                            init =
                                                                                                script
                                                                                                    {
                                                                                                        executable = pkgs.writeShellScript "token-init" ( builtins.readFile ( self + "/scripts/test/util/token.sh" ) ) ;
                                                                                                        sets =
                                                                                                            { string , ... } :
                                                                                                                [
                                                                                                                    ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                                                    ( string "CUT" "${ pkgs.coreutils }/bin/cut" )
                                                                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                    ( string "SHA512SUM" "${ pkgs.coreutils }/bin/sha512sum" )
                                                                                                                    ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                                                                ] ;
                                                                                                    } ;
                                                                                        } ;
                                                                            } ;
                                                                    } ;
                                                                temporary-path = "bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b" ;
                                                            } ;
                                            in
                                                pkgs.stdenv.mkDerivation
                                                    {
                                                        name = "temporary-test" ;
                                                        nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                        src = ./. ;
                                                        installPhase =
                                                            let
                                                                mapper =
                                                                    path : name : value :
                                                                        if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                        else if builtins.typeOf value == "string" then
                                                                            let
                                                                                echo = builtins.concatStringsSep "" [ "$" "{" " " "echo" " " "}" ] ;
                                                                                has-arguments = builtins.elemAt path 0 ;
                                                                                arguments = builtins.elemAt path 1 ;
                                                                                has-standard-input = builtins.elemAt path 2 ;
                                                                                standard-input = builtins.elemAt path 3 ;
                                                                                status = builtins.elemAt path 7 ;
                                                                                paste = builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" path ) ) ;
                                                                                identity = builtins.concatStringsSep "" [ "$" "{" " " "resources" " " "." " " "temporary" " " "." " " "util" " " "." " " "identity" " " "}" ] ;
                                                                                command-without-resources = builtins.concatStringsSep " . " ( builtins.map ( x : "\"${ x }\"" ) ( builtins.concatLists [ path [ name ] ] ) ) ;
                                                                                command = builtins.concatStringsSep "" [ "$" "{" " " "resources" " " "." " " "temporary" " " "." " " "temporary" " " "." " " command-without-resources " " "}" ] ;
                                                                                with-arguments = if has-arguments == "false" then command else builtins.concatStringsSep " " [ command arguments ] ;
                                                                                with-standard-input =
                                                                                    if has-standard-input == "interactive" then with-arguments
                                                                                    else if has-standard-input == "pipe" then "${ echo } ${ standard-input } | ${ with-arguments }"
                                                                                    else if has-standard-input == "file" then "${ with-arguments } < $( ${ identity } ${ standard-input } )"
                                                                                    else builtins.throw "The has-standard-input argument was not either interactive, pipe, or file but ${ has-standard-input }." ;
                                                                                with-status = if status == "0" then "${ echo } paste: ${ paste } >> $( ${ with-standard-input } )" else "! ${ with-standard-input }" ;
                                                                                in [ "#" with-status with-status with-status "#" ]
                                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a set nor a string." ;
                                                                in
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                            cleanup ( )
                                                                                {
                                                                                    ${ pkgs.coreutils }/bin/echo $out &&
                                                                                        if [ -f /build/debug ]
                                                                                        then
                                                                                            ${ pkgs.coreutils }/bin/cat /build/debug &&
                                                                                                exit 67
                                                                                        fi
                                                                                } &&
                                                                            trap cleanup EXIT &&
                                                                            ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/diff.sh" } $out/bin/diff.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/diff.sh &&
                                                                            makeWrapper $out/bin/diff.sh $out/bin/diff --set DIFF ${ pkgs.diffutils }/bin/diff --set SELF $out &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-expectate.sh" } $out/bin/re-expectate.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-expectate.sh &&
                                                                            makeWrapper $out/bin/re-expectate.sh $out/bin/re-expectate --set CP ${ pkgs.coreutils }/bin/cp --set GIT ${ pkgs.git }/bin/git --set OBSERVED $out/observed --set TOUCH ${ pkgs.coreutils }/bin/touch &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/observed-external.sh" } $out/bin/observed-external.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/observed-external.sh &&
                                                                            makeWrapper $out/bin/observed-external.sh $out/bin/observed-external --set BASH ${ pkgs.bash }/bin/bash --set FIND ${ pkgs.findutils }/bin/find --set GREP ${ pkgs.gnugrep }/bin/grep --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set OBSERVED_INTERNAL $out/bin/observed-internal --set SLEEP ${ pkgs.coreutils }/bin/sleep --set WC ${ pkgs.coreutils }/bin/wc &&

                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-observate.sh" } $out/bin/re-observate.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-observate.sh &&
                                                                            makeWrapper $out/bin/re-observate.sh $out/bin/re-observate --set ECHO ${ pkgs.coreutils }/bin/echo --set GIT ${ pkgs.git }/bin/git --set OBSERVATE_FILE ${ builtins.toFile "observed-internal.nix" ( builtins.concatStringsSep " &&\n\t" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) resources.temporary.temporary ) ) ) ) } --set SED ${ pkgs.gnused }/bin/sed &&

                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "observed-internal" ( if builtins.pathExists ( self + "/scripts/test/util/observed-internal.nix" ) then ( builtins.concatStringsSep " &&\n" [ ( builtins.import ( self + "/scripts/test/util/observed-internal.nix" ) resources "${ pkgs.coreutils }/bin/echo" ) "${ builtins.concatStringsSep "" [ "$" "{" "SLEEP" "}" ] } 10s" "${ pkgs.coreutils }/bin/echo TARGET_PID=${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] }" "${ builtins.concatStringsSep "" [ "$" "{" "FIND" "}" ] } /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${ builtins.concatStringsSep "" [ "$" "{" "GREP" "}" ] } ^temporary {} \\; | ${ builtins.concatStringsSep "" [ "$" "{" "WC" "}" ] } --lines > /build/observed/temporary/counts/mid" ] ) else "" ) } $out/bin/observed-internal.sh &&
                                                                            # ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "observed-internal" ( builtins.concatStringsSep " &&\n" [ ( builtins.import ( self + "/scripts/test/util/observed-internal.nix" ) resources "${ pkgs.coreutils }/bin/echo" ) "${ builtins.concatStringsSep "" [ "$" "{" "SLEEP" "}" ] } 10s" "${ pkgs.coreutils }/bin/echo TARGET_PID=${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] }" "${ builtins.concatStringsSep "" [ "$" "{" "FIND" "}" ] } /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${ builtins.concatStringsSep "" [ "$" "{" "GREP" "}" ] } ^temporary {} \\; | ${ builtins.concatStringsSep "" [ "$" "{" "WC" "}" ] } --lines > /build/observed/temporary/counts/mid" ] ) } $out/bin/observed-internal.sh &&
                                                                            makeWrapper $out/bin/observed-internal.sh $out/bin/observed-internal --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set GREP ${ pkgs.gnugrep }/bin/grep --set SLEEP ${ pkgs.coreutils }/bin/sleep --set WC ${ pkgs.coreutils }/bin/wc &&

                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test-external.sh" } $out/bin/test-external.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/test-external.sh &&
                                                                            makeWrapper $out/bin/test-external.sh $out/bin/test-external --set BASH_UNIT ${ pkgs.bash_unit }/bin/bash_unit --set DIFF ${ pkgs.diffutils }/bin/diff --set ECHO ${ pkgs.coreutils }/bin/echo --set EXPECTED ${ self + "/expected" } --set FIND ${ pkgs.findutils }/bin/find --set OBSERVED $out/observed --set TEST_INTERNAL ${ self + "/scripts/test/util/test-internal.sh" } &&
                                                                            if $out/bin/observed-external
                                                                            then
                                                                                ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&
                                                                                    if [ -f ${ self + "/expected/.gitignore" } ]
                                                                                    then
                                                                                        ${ pkgs.coreutils }/bin/cp ${ self + "/expected/.gitignore" } $out/observed/.gitignore
                                                                                    else
                                                                                        ${ pkgs.coreutils }/bin/echo "**/observed-*.yaml" > $out/observed/.gitignore
                                                                                    fi
                                                                            fi &&
                                                                            $out/bin/test-external &&
                                                                            exit ${ builtins.toString 0 }
                                                                    '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
