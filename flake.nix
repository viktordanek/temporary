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
                                        let
                                            resources =
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
                                                                temporary =
                                                                    let
                                                                        arguments =
                                                                            speed : init-path-seed : release-path-seed :
                                                                            {
                                                                                echo = "${ pkgs.coreutils }/bin/echo" ;
                                                                                init-path-seed = init-path-seed ;
                                                                                jq = "${ pkgs.jq }/bin/jq" ;
                                                                                release-path-seed = release-path-seed ;
                                                                                self = self ;
                                                                                speed = speed ;
                                                                                writeShellScript = pkgs.writeShellScript ;
                                                                                yq = "${ pkgs.yq }/bin/yq" ;
                                                                            } ;
                                                                        in
                                                                            {
                                                                                "0" =
                                                                                    {
                                                                                        dc0d9770 =
                                                                                            {
                                                                                                ef7d732e = builtins.import ( self + "/idea.nix" ) arguments 0 "dc0d9770" "ef7d732e" ;
                                                                                                e8c71063 = builtins.import ( self + "/idea.nix" ) arguments 0 "dc0d9770" "e8c71063" ;
                                                                                            } ;
                                                                                        c563cc36 =
                                                                                            {
                                                                                                ef7d732e = builtins.import ( self + "/idea.nix" ) arguments 0 "c563cc36" "ef7d732e" ;
                                                                                                e8c71063 = builtins.import ( self + "/idea.nix" ) arguments 0 "c563cc36" "e8c71063" ;
                                                                                            } ;
                                                                                    } ;
                                                                                "65" =
                                                                                    {
                                                                                        dc0d9770 =
                                                                                            {
                                                                                                ef7d732e = builtins.import ( self + "/idea.nix" ) arguments 65 "dc0d9770" "ef7d732e" ;
                                                                                                e8c71063 = builtins.import ( self + "/idea.nix" ) arguments 65 "dc0d9770" "e8c71063" ;
                                                                                            } ;
                                                                                        c563cc36 =
                                                                                            {
                                                                                                ef7d732e = builtins.import ( self + "/idea.nix" ) arguments 65 "c563cc36" "ef7d732e" ;
                                                                                                e8c71063 = builtins.import ( self + "/idea.nix" ) arguments 65 "c563cc36" "e8c71063" ;
                                                                                            } ;
                                                                                    } ;
                                                                                "66" =
                                                                                    {
                                                                                        dc0d9770 =
                                                                                            {
                                                                                                ef7d732e = builtins.import ( self + "/idea.nix" ) arguments 66 "dc0d9770" "ef7d732e" ;
                                                                                                e8c71063 = builtins.import ( self + "/idea.nix" ) arguments 66 "dc0d9770" "e8c71063" ;
                                                                                            } ;
                                                                                        c563cc36 =
                                                                                            {
                                                                                                ef7d732e = builtins.import ( self + "/idea.nix" ) arguments 66 "c563cc36" "ef7d732e" ;
                                                                                                e8c71063 = builtins.import ( self + "/idea.nix" ) arguments 66 "c563cc36" "e8c71063" ;
                                                                                            } ;
                                                                                    } ;
                                                                            } ;
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
                                                                                    post =
                                                                                        script
                                                                                            {
                                                                                                executable = pkgs.writeShellScriptBin "release" ( builtins.readFile ( self + "/scripts/test/util/nothing.sh" ) ) ;
                                                                                                sets =
                                                                                                    { string , ... } :
                                                                                                        [
                                                                                                            ( string "KEY" "af2d8a6c0991844a28552999365d9f3b801909d8037278545af9cd463e0790a55eed8085450aabbde5e2f9f7d012278491f58ddda61535278ba242ed0d0a19cc" )
                                                                                                        ] ;
                                                                                            } ;
                                                                                    release =
                                                                                        script
                                                                                            {
                                                                                                executable = pkgs.writeShellScriptBin "release" ( builtins.readFile ( self + "/scripts/test/util/nothing.sh" ) ) ;
                                                                                                sets =
                                                                                                    { string , ... } :
                                                                                                        [
                                                                                                            ( string "KEY" "56c5af264b10e98f8c6921342305a49d2e29b161cb2590d7d9c393710838fed3b64aa74371a852cafb3c31f876a1ebb2e96e3b8feed01bf23f09df4f36583ab8" )
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
                                                                genesis =
                                                                    let
                                                                        genesis =
                                                                            [
                                                                                {
                                                                                    condition = ! builtins.pathExists ( self + "/idea.nix" ) ;
                                                                                    expression =
                                                                                        let
                                                                                            denumber = builtins.replaceStrings [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ] [ "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" ] ;
                                                                                            file =
                                                                                                let
                                                                                                    nix = builtins.concatStringsSep "\n" ( builtins.concatLists [ [ "{ echo , jq , self , speed , status , writeShellScript , yq } :" "\t{" ] ( builtins.map ( indent 2 ) levels ) [ "\t}" ] ] ) ;
                                                                                                    in builtins.toFile "idea.nix" nix ;
                                                                                            indent = depth : value : "${ builtins.concatStringsSep "" ( builtins.genList ( i : "\t" ) depth ) }${ value }" ;
                                                                                            levels =
                                                                                                let
                                                                                                    levels =
                                                                                                        let
                                                                                                            levels =
                                                                                                                let
                                                                                                                    generator = index : builtins.elemAt levels ( ( builtins.length levels ) - index - 1 ) ;
                                                                                                                    levels =
                                                                                                                        let
                                                                                                                            levels =
                                                                                                                                [
                                                                                                                                    { name = "init-status" ; value = [ "status" ] ; }
                                                                                                                                    { name = "init-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                                                                                    { name = "init-standard-output" ; value = [ builtins.null builtins.null ] ; }
                                                                                                                                    { name = "init-standard-error" ; value = [ builtins.null builtins.null ] ; }
                                                                                                                                    { name = "init-path-seed" ; value = [ "init-path-seed" ] ; }
                                                                                                                                    { name = "init-variable-seed" ; value = [ builtins.null builtins.null ] ; }
                                                                                                                                    { name = "release-status" ; value = [ "status" ] ; }
                                                                                                                                    { name = "release-typeOf" ; value = [ "lambda" "null" ] ; }
                                                                                                                                    { name = "release-standard-output" ; value = [ builtins.null builtins.null ] ; }
                                                                                                                                    { name = "release-standard-error" ; value = [ builtins.null builtins.null ] ; }
                                                                                                                                    { name = "release-path-seed" ; value = [ "release-path-seed" ] ; }
                                                                                                                                    { name = "release-variable-seed" ; value = [ builtins.null builtins.null ] ; }
                                                                                                                                    { name = "speed" ; value = [ "speed" ] ; }
                                                                                                                                ] ;
                                                                                                                            mapper =
                                                                                                                                value :
                                                                                                                                    let
                                                                                                                                        level-value =
                                                                                                                                            let
                                                                                                                                                generator =
                                                                                                                                                    index :
                                                                                                                                                        let
                                                                                                                                                            level-value = builtins.elemAt value.value index ;
                                                                                                                                                            in builtins.toString ( if builtins.typeOf level-value == "null" then "${ value.name }-${ builtins.toString index }" else level-value ) ;
                                                                                                                                                in builtins.genList generator ( builtins.length value.value ) ;
                                                                                                                                        in
                                                                                                                                            { name = value.name ; value = level-value ; } ;
                                                                                                                            in builtins.map mapper levels ;
                                                                                                                    in builtins.genList generator ( builtins.length levels ) ;
                                                                                                            reducer =
                                                                                                                previous : current :
                                                                                                                    let
                                                                                                                        levels =
                                                                                                                            let
                                                                                                                                mapper = value : { name = value ; value = previous ; } ;
                                                                                                                                in builtins.map mapper current.value ;
                                                                                                                        in builtins.listToAttrs levels ;
                                                                                                            in builtins.foldl' reducer builtins.null levels ;
                                                                                                    mapper =
                                                                                                        path : name : value :
                                                                                                            if builtins.typeOf value == "null" then
                                                                                                                let
                                                                                                                    escape = value : builtins.concatStringsSep "" [ "$" "{" " " value " " "}" ] ;
                                                                                                                    init =
                                                                                                                        if values.init-typeOf == "lambda" then
                                                                                                                            [
                                                                                                                                "init ="
                                                                                                                                "\tscript"
                                                                                                                                "\t\t{"
                                                                                                                                "\t\t\texecutable = writeShellScript \"init\" ( self + \"/scripts/test/temporary.sh\" ) ;"
                                                                                                                                "\t\t\tsets ="
                                                                                                                                "\t\t\t\t{ is-file , is-pipe , path , standard-input , string } :"
                                                                                                                                "\t\t\t\t\t["
                                                                                                                                "\t\t\t\t\t\t( string \"ECHO\" \"${ escape "echo" }\" )"
                                                                                                                                "\t\t\t\t\t\t( is-file \"IS_FILE\" )"
                                                                                                                                "\t\t\t\t\t\t( is-pipe \"IS_PIPE\" )"
                                                                                                                                "\t\t\t\t\t\t( string \"JQ\" \"${ escape "jq" }\" )"
                                                                                                                                "\t\t\t\t\t\t( path \"NAME\" 2 )"
                                                                                                                                "\t\t\t\t\t\t( path \"PATH_SEED\" 0 )"
                                                                                                                                "\t\t\t\t\t\t( speed \"SPEED\" \"${ escape "speed" }\" )"
                                                                                                                                "\t\t\t\t\t\t( string \"STATUS\" \"${ escape "status" }\" )"
                                                                                                                                "\t\t\t\t\t\t( string \"VARIABLE_SEED\" \"${ values.init-variable-seed }\" )"
                                                                                                                                "\t\t\t\t\t\t( standard-input \"STANDARD_INPUT\" )"
                                                                                                                                "\t\t\t\t\t\t( string \"YQ\" \"${ escape "yq" }\" )"
                                                                                                                                "\t\t\t\t\t] ;"
                                                                                                                                "\t\t} ;"
                                                                                                                            ]
                                                                                                                        else if values.init-typeOf == "null" then [ ]
                                                                                                                        else builtins.throw "init is neither lambda nor null but \"${ values.init }\"." ;
                                                                                                                    post = init ;
                                                                                                                    release = init ;
                                                                                                                    values =
                                                                                                                        let
                                                                                                                            generator = index : { name = builtins.elemAt values index ; value = builtins.elemAt ( builtins.concatLists [ path [ name ] ] ) index ; } ;
                                                                                                                            values =
                                                                                                                                [
                                                                                                                                    "init-status"
                                                                                                                                    "init-typeOf"
                                                                                                                                    "init-standard-output"
                                                                                                                                    "init-standard-error"
                                                                                                                                    "init-path-seed"
                                                                                                                                    "init-variable-seed"
                                                                                                                                    "release-status"
                                                                                                                                    "release-typeOf"
                                                                                                                                    "release-standard-output"
                                                                                                                                    "release-standard-error"
                                                                                                                                    "release-path-seed"
                                                                                                                                    "release-variable-seed"
                                                                                                                                    "speed"
                                                                                                                                ] ;
                                                                                                                            in builtins.listToAttrs ( builtins.genList generator ( builtins.length values ) ) ;
                                                                                                                    in
                                                                                                                        builtins.concatLists
                                                                                                                            [
                                                                                                                                [
                                                                                                                                    "# ${ builtins.toJSON values }"
                                                                                                                                    "${ denumber ( builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.toJSON values ) ) ) }.${ values.init-path-seed }.${ values.release-path-seed } = "
                                                                                                                                    "\tscript :"
                                                                                                                                    "\t\t{"
                                                                                                                                ]
                                                                                                                                    ( builtins.map ( indent 3 ) init )
                                                                                                                                [
                                                                                                                                    "\t} ;"
                                                                                                                                ]
                                                                                                                        ]
                                                                                                            else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                                                            else builtins.throw "The level at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } is neither a null nor a set but a ${ builtins.typeOf value }." ;
                                                                                                    in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) levels ) ) ;
                                                                                            in "${ pkgs.coreutils }/bin/echo idea.nix is undefined. && makeWrapper ${ pkgs.writeShellScript "reideate" ( builtins.readFile ( self + "/scripts/test/util/reideate.sh" ) ) } $out --set CAT ${ pkgs.coreutils }/bin/cat --set IDEA_FILE ${ file }" ;
                                                                                }
                                                                                {
                                                                                    condition = ! builtins.pathExists ( self + "/observate.nix" ) ;
                                                                                    expression =
                                                                                        let
                                                                                            file =
                                                                                                let
                                                                                                    expressions =
                                                                                                        let
                                                                                                            mapper =
                                                                                                                path : name : value :
                                                                                                                    if builtins.typeOf value == "string" then
                                                                                                                        let
                                                                                                                            command = builtins.concatStringsSep " . " ( builtins.concatLists [ [ "resources" "temporary" "temporary" ] ( builtins.map ( x : "\${ x }\"" ) ( builtins.concatLists [ path [ name ] ] ) ) ] ) ;
                                                                                                                            in [ command ]
                                                                                                                    else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                                                                    else builtins.throw "The temporary at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } is neither a string nor a set but a ${ builtins.typeOf value }." ;
                                                                                                            in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) resources.temporary.temporary ) ) ;
                                                                                                    in builtins.toFile "observate.nix" "WTF" ;
                                                                                            in "${ pkgs.coreutils }/bin/echo observate.nix is undefined. && makeWrapper ${ pkgs.writeShellScript "reobservate" ( builtins.readFile ( self + "/scripts/test/util/re.sh" ) ) } $out --set CAT ${ pkgs.coreutils }/bin/cat --set GIT ${ pkgs.git }/bin/git --set SOURCE ${ file } --set TARGET observe.nix" ;
                                                                                }
                                                                                {
                                                                                    condition = true ;
                                                                                    expression = "${ pkgs.coreutils }/bin/touch $out" ;
                                                                                }
                                                                            ] ;
                                                                        in builtins.getAttr "expression" ( builtins.elemAt ( builtins.filter ( g : g.condition ) genesis ) 0 ) ;
                                                                in
                                                                    ''
                                                                        ${ genesis } &&
                                                                            if [ "${ genesis }" != "${ pkgs.coreutils }/bin/touch $out" ]
                                                                            then
                                                                                ${ pkgs.coreutils }/bin/echo $out &&
                                                                                    exit 64
                                                                            fi
                                                                    '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
