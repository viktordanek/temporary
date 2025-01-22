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
                                    store ? "bb8a0f30f43c48f4abcc70b9be4611e9dac31a5768c24383111b1240c35e22a4a3bac382ded1b154559b64424789499391d1b73cc3ad92157c4a5f341e9689e4" ,
                                    target ,
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
                                                                            release ? builtins.null ,
                                                                            post ? builtins.null
                                                                        } :
                                                                            {
                                                                                init =
                                                                                    if builtins.typeOf init == "lambda" then init
                                                                                    else if builtins.typeOf init == "null" then builtins.null
                                                                                    else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf init }." ;
                                                                                release =
                                                                                    if builtins.typeOf release == "lambda" then release
                                                                                    else if builtins.typeOf release == "null" then builtins.null
                                                                                    else builtins.throw "The release defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf release }." ;
                                                                                post =
                                                                                    if builtins.typeOf post == "lambda" then post
                                                                                    else if builtins.typeOf post == "null" then builtins.null
                                                                                    else builtins.throw "The post defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf post }." ;
                                                                            } ;
                                                                    script =
                                                                        {
                                                                            executable ,
                                                                            sets ? { }
                                                                        } :
                                                                            let
                                                                                xxx =
                                                                                    path : name : ( builtins.trace "Z6" ( binary :
                                                                                        builtins.trace "Z7" (
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
                                                                                                            if
                                                                                                                builtins.typeOf sets == "lambda" &&
                                                                                                                    builtins.typeOf ( sets ( harvest "$OUT" ) ) == "set" && builtins.all ( s : builtins.typeOf s == "string" ) ( builtins.attrValues ( sets ( harvest "$OUT" ) ) )
                                                                                                            then
                                                                                                                builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( name : value : [ "--set ${ name } ${ value }" ] ) ( sets ( harvest "$out" ) ) ) )
                                                                                                            else if
                                                                                                                builtins.typeOf sets == "set" && builtins.all ( s : builtins.typeOf s == "string" ) ( builtins.attrValues sets )
                                                                                                                then
                                                                                                                    builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( name : value : [ "--set ${ name } ${ value }" ] ) sets ) )
                                                                                                            else builtins.throw "The sets is neither a lambda that generates a set of strings nor a set of strings."
                                                                                                        )
                                                                                                    ]
                                                                                            ) ) ) ) ;
                                                                                in path : name : binary : "${ pkgs.coreutils }/bin/true" ;
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
                                                                                        "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }"
                                                                                        "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }/${ name }"
                                                                                    ]
                                                                                    (
                                                                                        if computed.init == null then [ ]
                                                                                        # else [ (  computed.init path name "init.sh" ) ]
                                                                                        else [ ]
                                                                                    )
                                                                                    (
                                                                                        if computed.release == null then [ ]
                                                                                        # else [ ( computed.release path name "release.sh" ) ]
                                                                                        else [ ]
                                                                                    )
                                                                                    (
                                                                                        if computed.post == null then [ ]
                                                                                        # else [ ( computed.post path name "post.sh" ) ]
                                                                                        else [ ]
                                                                                    )
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/setup.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh ${ builtins.concatStringsSep "/" path }/${ name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo --set ERROR ${ builtins.toString temporary-initialization-error } --set INIT ${ builtins.concatStringsSep "/" path }/${ name }/init.sh --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ builtins.concatStringsSep "/" path }/${ name }/release.sh --set POST ${ builtins.concatStringsSep "/" path }/${ name }/post.sh --set TAIL ${ pkgs.coreutils }/bin/tail --set TEARDOWN_ASYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch --set TEE ${ pkgs.coreutils }/bin/tee --set TARGET ${ target } --set ${ temporary-path } ${ builtins.concatStringsSep "/" ( builtins.concatLists [ ( builtins.map ( n : builtins.elemAt path n ) ( builtins.filter ( n : n > 2 ) ( builtins.genList ( n : n ) ( builtins.length path ) ) ) ) [ name ] ] ) }"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-asynch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set ECHO ${ pkgs.coreutils }/bin/echo --set NICE ${ pkgs.coreutils }/bin/nice  --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-synch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch  --set BASENAME ${ pkgs.coreutils }/bin/basename --set CHMOD ${pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock  --set MV ${pkgs.coreutils }/bin/mv --set RM ${pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set CAT ${ pkgs.coreutils }/bin/cat"
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
                                                                builtins.concatStringsSep " && " ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "$out" ] ) dependencies ) ) ) ;
                                                } ;
                                        harvest =
                                            derivation :
                                                let
                                                    mapper =
                                                        path : name : value :
                                                            if builtins.typeOf value == "lambda" then "${ builtins.concatStringsSep "/" path }/${ name }/setup"
                                                            else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                            else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
                                                    in builtins.mapAttrs ( mapper [ derivation ] ) { temporary = temporary ; } ;
                                        in harvest ( builtins.toString derivation ) ;
                            pkgs = import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        let
                                            re-observate =
                                                let
                                                    mapper =
                                                        { command , has-arguments , arguments , has-standard-input , standard-input , init-status , paste , set } :
                                                            let
                                                                args = if has-arguments then "${ command } ${ arguments }" else "${ command }" ;
                                                                stdin = if has-standard-input then args else "${ pkgs.coreutils }/bin/echo ${ standard-input } | ${ args }" ;
                                                                in if init-status then "${ pkgs.coreutils }/bin/echo ${ paste } > $( ${ stdin } )" else "! ${ stdin }" ;
                                                    string = builtins.concatStringsSep " &&\n\t" ( builtins.map mapper temporary ) ;
                                                    in pkgs.writeShellScript "observate" ( builtins.concatStringsSep "\n" [ "resources" ":" "echo" ":" "''" string "''" ] ) ;
                                            resources =
                                                lib
                                                    {
                                                        at =
                                                            pkgs.writeShellScript
                                                                "at"
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/cat | ${ pkgs.bash }/bin/bash &
                                                                '' ;
                                                        target = "e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d" ;
                                                        temporary =
                                                            {
                                                                temporary =
                                                                    let
                                                                        reducer = previous : current : pkgs.lib.recursiveUpdate previous current.set ;
                                                                        in builtins.foldl' reducer { } temporary ;
                                                                util =
                                                                    {
                                                                        token =
                                                                            script :
                                                                                {
                                                                                    init = script { executable = pkgs.writeShellScript "token-init" ( builtins.readFile ( self + "/scripts/test/util/token.sh" ) ) ; sets = { CHMOD = "${ pkgs.coreutils }/bin/chmod" ; CUT = "${ pkgs.coreutils }/bin/cut" ; ECHO = "${ pkgs.coreutils }/bin/echo" ; TEE = "${ pkgs.coreutils }/bin/tee" ; } ; } ;
                                                                                } ;
                                                                    } ;
                                                            } ;
                                                        temporary-path = "bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b" ;
                                                    } ;
                                            temporary =
                                                let
                                                    list =
                                                        let
                                                            generator = index : ( builtins.elemAt list index ) // { index = index ; } ;
                                                            list =
                                                                let
                                                                    levels = [ "arguments" "standard-input" "init-typeOf" "init-standard-output" "init-standard-error" "init-status" "release-typeOf" "release-standard-output" "release-standard-error" "release-status" ] ;
                                                                    reducer =
                                                                        previous : current :
                                                                            if builtins.any ( c : c == current ) [ "arguments" "standard-input" "init-standard-output" "init-standard-error" "init-status" "release-standard-output" "release-standard-error" "release-status" ] then builtins.concatLists [ ( builtins.map ( p : p // { "${ current }" = true ; } ) previous ) ( builtins.map ( p : p // { "${ current }" = false ; } ) previous ) ]
                                                                            else if builtins.any ( c : c == current ) [ "init-typeOf" "release-typeOf" ] then builtins.concatLists [ ( builtins.map ( p : p // { "${ current }" = true ; } ) previous ) ( builtins.map ( p : p // { "${ current }" = false ; } ) previous ) ( builtins.map ( p : p // { "${ current }" = null ; } ) previous ) ]
                                                                            else builtins.throw "We were not expecting ${ current }." ;
                                                                    in builtins.foldl' reducer [ { } ] levels ;
                                                            in builtins.genList generator ( builtins.length list ) ;
                                                    mapper =
                                                        { index , arguments , standard-input , init-typeOf , init-standard-output , init-standard-error , init-status , release-typeOf , release-standard-output , release-standard-error , release-status } :
                                                            let
                                                                hash = string : builtins.replaceStrings [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ] [ "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" ] ( builtins.hashString "md5" ( builtins.concatStringsSep "-" [ ( builtins.toString index ) string ] ) ) ;
                                                                mod = a : b : a - b * ( a / b ) ;
                                                                rand =
                                                                    string :
                                                                        let
                                                                            str = builtins.replaceStrings [ "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "a" "b" "c" "d" "e" "f" ] [ "00" "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" ] ( hash string ) ;
                                                                            in builtins.foldl' ( previous : next : previous + next ) 0 ( builtins.genList ( index : builtins.fromJSON ( builtins.substring index 1 str ) ) ( builtins.stringLength str ) ) ;
                                                                values =
                                                                    {
                                                                        arguments = if arguments then hash "arguments" else "" ;
                                                                        standard-input = if standard-input then hash "standard-input" else "" ;
                                                                        init-typeOf = if init-typeOf == true then "lambda" else if init-typeOf == false then "string" else "null" ;
                                                                        init-standard-output = if init-standard-output then hash "init-standard-output true" else hash "init-standard-output false" ;
                                                                        init-standard-error = if init-standard-error then hash "init-standard-error true" else hash "init-standard-error false" ;
                                                                        init-status = if init-status then "0" else builtins.toString ( ( mod ( rand "init-status" ) 254 ) + 1 ) ;
                                                                        release-typeOf = if release-typeOf == true then "lambda" else if release-typeOf == false then "string" else "null" ;
                                                                        release-standard-output = if release-standard-output then hash "release-standard-output true" else hash "release-standard-output false" ;
                                                                        release-standard-error = if release-standard-error then hash "release-standard-error true" else hash "release-standard-error false" ;
                                                                        release-status = if release-status then "0" else builtins.toString ( ( mod ( rand "release-status" ) 254 ) + 1 ) ;
                                                                    } ;
                                                                in
                                                                {
                                                                    command = builtins.concatStringsSep "" [ "$" "{" " " ( builtins.concatStringsSep "." ( builtins.map ( v : builtins.concatStringsSep "" [ "\"" v "\"" ] ) [ "resources" "temporary" "temporary" values.arguments values.standard-input values.init-typeOf values.init-standard-output values.init-standard-error values.init-status values.release-typeOf values.release-standard-output values.release-standard-error values.release-status ] ) ) " " "}" ] ;
                                                                    has-arguments = arguments ;
                                                                    arguments = values.arguments ;
                                                                    has-standard-input = standard-input ;
                                                                    standard-input = values.standard-input ;
                                                                    init-status = init-status ;
                                                                    paste = hash "paste" ;
                                                                    set =
                                                                        {
                                                                            "${ values.arguments }"."${ values.standard-input }"."${ values.init-typeOf }"."${ values.init-standard-output }"."${ values.init-standard-error }"."${ values.init-status }"."${ values.release-typeOf }"."${ values.release-standard-output }"."${ values.release-standard-error }"."${ values.release-status }" =
                                                                                script :
                                                                                    let
                                                                                        sets =
                                                                                            {
                                                                                                lambda =
                                                                                                    variable : url : harvest :
                                                                                                        script
                                                                                                            ( builtins.trace "HI url=${ url } variable=${ variable }"
                                                                                                            {
                                                                                                                executable = builtins.trace "HI Z1" ( pkgs.writeShellScript variable ( builtins.readFile ( self + url ) ) ) ;
                                                                                                                sets =
                                                                                                                    builtins.trace "HI Z2"
                                                                                                                    {
                                                                                                                        CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                        CUT = "${ pkgs.coreutils }/bin/cut" ;
                                                                                                                        ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                        SHA512SUM = "${ pkgs.coreutils }/bin/sha512sum" ;
                                                                                                                        TEE = "${ pkgs.coreutils }/bin/tee" ;
                                                                                                                        TOKEN = harvest.temporary.util.token ;
                                                                                                                        VARIABLE = hash "sets - ${ variable }" ;
                                                                                                                    } ;
                                                                                                            } ) ;
                                                                                                string =
                                                                                                    variable : url :
                                                                                                        script
                                                                                                            {
                                                                                                                executable = builtins.trace "HI Z3" ( pkgs.writeShellScript variable ( builtins.readFile ( self + url ) ) ) ;
                                                                                                                sets =
                                                                                                                    builtins.trace "HI Z4"
                                                                                                                    {
                                                                                                                        CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                        CUT = "${ pkgs.coreutils }/bin/cut" ;
                                                                                                                        ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                        TEE = "${ pkgs.coreutils }/bin/tee" ;
                                                                                                                        VARIABLE = hash "sets - ${ variable }" ;
                                                                                                                    } ;
                                                                                                            } ;
                                                                                            } ;
                                                                                        in
                                                                                            if init-typeOf == true then
                                                                                                if release-typeOf == true then
                                                                                                    {
                                                                                                        init = sets.lambda "init" "/scripts/test/temporary/init.sh" ;
                                                                                                        release = sets.lambda "release" "/scripts/test/temporary/release.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                                else if release-typeOf == false then
                                                                                                    {
                                                                                                        init = sets.lambda "init" "/scripts/test/temporary/init.sh" ;
                                                                                                        release = sets.string "release" "/scripts/test/temporary/release.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                                else
                                                                                                    {
                                                                                                        init = sets.lambda "init" "/scripts/test/temporary/init.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                            else if init-typeOf == false then
                                                                                                if release-typeOf == true then
                                                                                                    {
                                                                                                        init = sets.string "init" "/scripts/test/temporary/init.sh" ;
                                                                                                        release = sets.lambda "release" "/scripts/test/temporary/release.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                                else if release-typeOf == false then
                                                                                                    {
                                                                                                        init = sets.string "init" "/scripts/test/temporary/init.sh" ;
                                                                                                        release = sets.string "release" "/scripts/test/temporary/release.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                                else
                                                                                                    {
                                                                                                        init = sets.string "init" "/scripts/test/temporary/init.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                            else
                                                                                                if release-typeOf == true then
                                                                                                    {
                                                                                                        release = sets.lambda "release" "/scripts/test/temporary/release.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                                else if release-typeOf == false then
                                                                                                    {
                                                                                                        release = sets.string "release" "/scripts/test/temporary/release.sh" ;
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    }
                                                                                                else
                                                                                                    {
                                                                                                        post = sets.string "post" "/scripts/test/temporary/post.sh" ;
                                                                                                    } ;
                                                                        } ;
                                                                } ;
                                                    in builtins.map mapper list ;
                                            in
                                                pkgs.stdenv.mkDerivation
                                                    {
                                                        name = "temporary-test" ;
                                                        nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                        src = ./. ;
                                                        installPhase =
                                                            ''
                                                                ${ pkgs.coreutils }/bin/echo $out &&
                                                                    ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-expectate.sh" } $out/bin/re-expectate.sh &&
                                                                    ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-expectate.sh &&
                                                                    makeWrapper $out/bin/re-expectate.sh $out/bin/re-expectate --set CP ${ pkgs.coreutils }/bin/cp --set GIT ${ pkgs.git }/bin/git --set OBSERVED $out/observed --set TOUCH ${ pkgs.coreutils }/bin/touch &&
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-observate.sh" } $out/bin/re-observate.sh &&
                                                                    ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-observate.sh &&
                                                                    makeWrapper $out/bin/re-observate.sh $out/bin/re-observate --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set OBSERVATE ${ re-observate } &&
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test.sh" } $out/bin/test.sh &&

                                                                    ${ pkgs.coreutils }/bin/mkdir /build/observed &&
                                                                    ${ pkgs.coreutils }/bin/mkdir /build/observed/temporary &&
                                                                    ${ pkgs.findutils }/bin/find /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${ pkgs.gnugrep }/bin/grep ^temporary/ {} \; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/count.pre &&
                                                                    exit 1 &&
                                                                    ${ pkgs.coreutils }/bin/sleep 10s &&
                                                                    ${ pkgs.findutils }/bin/find /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name temporary -exec ${ pkgs.gnugrep }/bin/grep ^temporary/ {} \; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/count.post &&

                                                                    ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&

                                                                    export DIFF=${ pkgs.diffutils }/bin/diff &&
                                                                    export EXPECTED=${ self + "/expected" } &&
                                                                    export FIND=${ pkgs.findutils }/bin/find &&
                                                                    export OBSERVED=$out/observed &&
                                                                    ${ pkgs.bash_unit }/bin/bash_unit $out/bin/test.sh
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
