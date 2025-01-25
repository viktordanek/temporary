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
                                                                                        "if [ ! -d ${ builtins.concatStringsSep "/" path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path } ; fi"
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
                                                                        list =
                                                                            let
                                                                                list =
                                                                                    let
                                                                                        list =
                                                                                            let
                                                                                                levels = [ "arguments" "standard-input" "init-typeOf" "init-standard-output" "init-standard-error" "init-status" "release-typeOf" "release-standard-output" "release-standard-error" "release-status" "speed" ] ;
                                                                                                reducer =
                                                                                                    previous : current :
                                                                                                        let
                                                                                                            expand =
                                                                                                                n :
                                                                                                                    let
                                                                                                                        generator = index : builtins.map ( p : p // { "${ current }" = index ; } ) previous ;
                                                                                                                        in builtins.concatLists ( builtins.genList generator n ) ;
                                                                                                               generator = index : builtins.map ( p : p // { "${ current }" = index ; } ) previous ;
                                                                                                            in
                                                                                                                if builtins.any ( c : current == c ) [ "arguments" "init-typeOf" "init-standard-output" "init-standard-error" "release-standard-output" "release-typeOf" "release-standard-error" "speed" ] then expand 1
                                                                                                                else if builtins.any ( c : current == c ) [ "standard-input" "init-status" "release-status" "speed" ] then expand 2
                                                                                                                else builtins.throw "The level ${ current } is unexpected." ;
                                                                                                in builtins.foldl' reducer [ { } ] levels ;
                                                                                        generator = index : builtins.elemAt list index // { index = index ; } ;
                                                                                        in builtins.genList generator ( builtins.length list ) ;
                                                                                mapper =
                                                                                    { index , arguments , standard-input , init-typeOf , init-standard-output , init-standard-error , init-status , release-typeOf , release-standard-output , release-standard-error , release-status , speed } :
                                                                                        let
                                                                                            hash = string : builtins.replaceStrings [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" ] [ "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" ] ( builtins.substring 0 8 ( builtins.hashString "sha512" ( builtins.concatStringsSep "-" ( builtins.map builtins.toString [ index string ] ) ) ) ) ;
                                                                                            mod = a : b : a - ( b * ( a / b ) ) ;
                                                                                            rand =
                                                                                                string : n :
                                                                                                    let
                                                                                                        list =
                                                                                                            let
                                                                                                                generator = index : builtins.fromJSON ( builtins.substring index 1 str ) ;
                                                                                                                str = builtins.replaceStrings [ "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "a" "b" "c" "d" "e" "f" ] [ "00" "01" "02" "03" "04" "05" "06" "07" "08" "09" "10" "11" "12" "13" "14" "15" ] ( builtins.hashString "sha512" ( builtins.concatStringsSep "-" ( builtins.map builtins.toString [ index string ] ) ) ) ;
                                                                                                                in builtins.genList generator ( builtins.stringLength str ) ;
                                                                                                        reducer = previous : current : mod ( previous * 16 + current ) n ;
                                                                                                        in builtins.foldl' reducer 0 list ;
                                                                                            status = if init-status == 0 then "0" else builtins.toString ( 1 + ( rand init-status 254 ) ) ;
                                                                                            in
                                                                                                {
                                                                                                    "${ status }"."${ hash arguments }"."${ if standard-input == 0 then hash standard-input else "_" }"."${ hash "name" }" =
                                                                                                        let
                                                                                                            init = pkgs.writeShellScript "init" ( builtins.readFile ( self + "/scripts/test/temporary/init.sh" ) ) ;
                                                                                                            release = pkgs.writeShellScript "release" ( builtins.readFile ( self + "/scripts/test/temporary/release.sh" ) ) ;
                                                                                                            post = pkgs.writeShellScript "post" ( builtins.readFile ( self + "/script/test/temporary/post.sh" ) ) ;
                                                                                                            in
                                                                                                                script :
                                                                                                                    {
                                                                                                                        init =
                                                                                                                            script
                                                                                                                                {
                                                                                                                                    executable = pkgs.writeShellScript "init" ( builtins.readFile ( self + "/scripts/test/temporary/init.sh" ) ) ;
                                                                                                                                    sets =
                                                                                                                                        harvest :
                                                                                                                                            {
                                                                                                                                                CAT = "${ pkgs.coreutils }/bin/cut" ;
                                                                                                                                                ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                                                TYPEOF = "lambda" ;
                                                                                                                                                STANDARD_OUTPUT = hash init-standard-output ;
                                                                                                                                                STANDARD_ERROR = hash init-standard-error ;
                                                                                                                                                STATUS = status ;
                                                                                                                                                TOKEN_ARGUMENTS = hash "token arguments" ;
                                                                                                                                                TOKEN_STANDARD_INPUT = hash "token standard input" ;
                                                                                                                                                TOKEN_1 = harvest.temporary.util.token ;
                                                                                                                                            } ;
                                                                                                                                } ;
                                                                                                                        release =
                                                                                                                            script
                                                                                                                                {
                                                                                                                                    executable = pkgs.writeShellScript "release" ( builtins.readFile ( self + "/scripts/test/temporary/release.sh" ) ) ;
                                                                                                                                    sets =
                                                                                                                                        harvest :
                                                                                                                                            {
                                                                                                                                                CAT = "${ pkgs.coreutils }/bin/cut" ;
                                                                                                                                                ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                                                TYPEOF = "lambda" ;
                                                                                                                                                STANDARD_OUTPUT = hash release-standard-output ;
                                                                                                                                                STANDARD_ERROR = hash release-standard-error ;
                                                                                                                                                STATUS = if release-status == 0 then "0" else builtins.toString ( 1 + rand ( release-status 254 ) ) ;
                                                                                                                                                TOKEN_ARGUMENTS = hash "token arguments" ;
                                                                                                                                                TOKEN_STANDARD_INPUT = hash "token standard input" ;
                                                                                                                                                TOKEN_1 = harvest.temporary.util.token ;
                                                                                                                                            } ;
                                                                                                                                } ;
                                                                                                                        post =
                                                                                                                            script
                                                                                                                                {
                                                                                                                                    executable = pkgs.writeShellScript "post" ( builtins.readFile ( self + "/scripts/test/temporary/post.sh" ) ) ;
                                                                                                                                    sets =
                                                                                                                                        harvest :
                                                                                                                                            {
                                                                                                                                                DIFF = "${ pkgs.diffutils }/bin/diff" ;
                                                                                                                                                FIND = "${ pkgs.findutils }/bin/find" ;
                                                                                                                                                FLOCK = "${ pkgs.coreutils }/bin/flock" ;
                                                                                                                                                MKDIR = "${ pkgs.coreutils }/bin/mkdir" ;
                                                                                                                                                OBSERVED = harvest.temporary.util.post ;
                                                                                                                                                WC = "${ pkgs.coreutils }/bin/wc" ;
                                                                                                                                            } ;
                                                                                                                                } ;
                                                                                                                    } ;
                                                                                                } ;
                                                                                in builtins.map mapper list ;
                                                                        in builtins.foldl' pkgs.lib.recursiveUpdate {} list ;
                                                                util =
                                                                    {
                                                                        post =
                                                                            {
                                                                                observed =
                                                                                    script :
                                                                                        {
                                                                                            init = script { executable = pkgs.writeShellScript "observed" ( builtins.readFile ( self "/scripts/test/util/post/observed/init.sh" ) ) ; sets = { CAT = "${ pkgs.coreutils }/bin/cat" ; CHMOD = "${ pkgs.coreutils }/bin/chmod" ; ECHO = "${ pkgs.coreutils }/bin/echo" ; } ; } ;
                                                                                        } ;
                                                                            } ;
                                                                        token =
                                                                            script :
                                                                                {
                                                                                    init = script { executable = pkgs.writeShellScript "token-init" ( builtins.readFile ( self + "/scripts/test/util/token.sh" ) ) ; sets = { CHMOD = "${ pkgs.coreutils }/bin/chmod" ; CUT = "${ pkgs.coreutils }/bin/cut" ; ECHO = "${ pkgs.coreutils }/bin/echo" ; TEE = "${ pkgs.coreutils }/bin/tee" ; } ; } ;
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
                                                                                arguments = "${ value } ${ builtins.elemAt path 3 }" ;
                                                                                echo = builtins.concatStringsSep "" [ "$" "{" "ECHO" "}" ] ;
                                                                                standard-input =
                                                                                    let
                                                                                        standard-input = builtins.elemAt path 4 ;
                                                                                        in if standard-input == "_" then "${ arguments } NO ${ standard-input }" else "${ echo } ${ standard-input } | ${ arguments } YES ${ standard-input }" ;
                                                                                status =
                                                                                    let
                                                                                        status = builtins.elemAt path 2 ;
                                                                                        in if status == "0" then "${ echo } ${ builtins.substring 0 8 ( builtins.hashString "sha512" ( builtins.concatStringsSep "/" path ) ) } | $( ${ standard-input } )" else "! ${ standard-input }" ;
                                                                                in [ "#" ( builtins.concatStringsSep " " [ "#" ( builtins.concatStringsSep " / " path ) ] ) status status ]
                                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a set nor a string." ;
                                                                 in
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                            ${ pkgs.coreutils }/bin/echo $out &&
                                                                            ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-expectate.sh" } $out/bin/re-expectate.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-expectate.sh &&
                                                                            makeWrapper $out/bin/re-expectate.sh $out/bin/re-expectate --set CP ${ pkgs.coreutils }/bin/cp --set GIT ${ pkgs.git }/bin/git --set OBSERVED $out/observed --set TOUCH ${ pkgs.coreutils }/bin/touch &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test.sh" } $out/bin/test.sh &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/observed-external.sh" } $out/bin/observed-external.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/observed-external.sh &&
                                                                            makeWrapper $out/bin/observed-external.sh $out/bin/observed-external --set BASH ${ pkgs.bash }/bin/bash --set FIND ${ pkgs.findutils }/bin/find --set GREP ${ pkgs.gnugrep }/bin/grep --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set OBSERVED_INTERNAL $out/bin/observed-internal --set SLEEP ${ pkgs.coreutils }/bin/sleep --set WC ${ pkgs.coreutils }/bin/wc &&
                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "observed-internal" ( builtins.concatStringsSep " &&\n" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "resources" "temporary" ] ) resources.temporary.temporary ) ) ) ) } $out/bin/observed-internal.sh &&
                                                                            makeWrapper $out/bin/observed-internal.sh $out/bin/observed-internal --set ECHO ${ pkgs.coreutils }/bin/echo &&
                                                                            $out/bin/observed-external &&


                                                                            ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&

                                                                            export DIFF=${ pkgs.diffutils }/bin/diff &&
                                                                            export EXPECTED=${ self + "/expected" } &&
                                                                            export FIND=${ pkgs.findutils }/bin/find &&
                                                                            export OBSERVED=$out/observed &&
                                                                            ${ pkgs.bash_unit }/bin/bash_unit $out/bin/test.sh &&
                                                                            exit 10
                                                                    '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
