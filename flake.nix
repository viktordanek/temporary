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
                                    resource ,
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
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh ${ builtins.concatStringsSep "/" path }/${ name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo --set ERROR ${ builtins.toString temporary-initialization-error } --set GREP ${ pkgs.gnugrep }/bin/grep --set INIT ${ builtins.concatStringsSep "/" path }/${ name }/init.sh --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ builtins.concatStringsSep "/" path }/${ name }/release.sh --set POST ${ builtins.concatStringsSep "/" path }/${ name }/post.sh --set RESOURCE ${ resource } --set TAIL ${ pkgs.coreutils }/bin/tail --set TARGET ${ target } --set TEARDOWN_ASYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch --set TEMPORARY_PATH ${ temporary-path } --set TEMPORARY_PATH_ARRAY ${ builtins.concatStringsSep "/" ( builtins.concatLists [ ( builtins.map ( n : builtins.elemAt path n ) ( builtins.filter ( n : n > 1 ) ( builtins.genList ( n : n ) ( builtins.length path ) ) ) ) [ name ] ] ) } --set TEE ${ pkgs.coreutils }/bin/tee --set TEMPORARY_RESOURCE_MASK ${ temporary-resource-mask }"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-asynch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set ECHO ${ pkgs.coreutils }/bin/echo --set NICE ${ pkgs.coreutils }/bin/nice  --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-synch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch  --set BASENAME ${ pkgs.coreutils }/bin/basename --set CHMOD ${pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock  --set MV ${pkgs.coreutils }/bin/mv --set RM ${pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set TRUE ${ pkgs.coreutils }/bin/true --set CAT ${ pkgs.coreutils }/bin/cat"
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
                                                let
                                                    temporary =
                                                        let
                                                            fields =
                                                                let
                                                                    hash = index : string : val : builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" ( builtins.map builtins.toString [ index string val ] ) ) ) ;
                                                                    lambda = index : string : val : "lambda" ;
                                                                    status =
                                                                        index : string : val :
                                                                        let
                                                                            list =
                                                                                let
                                                                                    generator = i : builtins.fromJSON ( builtins.substring i 1 ( builtins.replaceString [ "a" "b" "c" "d" "e" "f" ] [ "10" "11" "12" "13" "14" "15" ] ( hash index string val ) ) ) ;
                                                                                    in builtins.genList generator 8 ;
                                                                            reducer =
                                                                                let
                                                                                    mod = a : b : a - ( b * ( a / b ) ) ;
                                                                                    in previous : current : mod ( previous * 16 + current ) 254 ;
                                                                            in builtins.toString ( if val == 0 then 0 else ) ;
                                                                    zero = index : string : val : if val == 0 then "_" else hash index string val ;
                                                                    in
                                                                        [
                                                                            { name = "arguments" ; size = 1 ; lambda = hash ; }
                                                                            { name = "standard-input" ; size = 2 ; lambda = zero ; }
                                                                            { name = "init-typeOf" ; size = 1 ; lambda = lambda ; }
                                                                            { name = "init-standard-output" ; size = 1 ; lambda = hash ; }
                                                                            { name = "init-standard-error" ; size = 1 ; lambda = hash ; }
                                                                            { name = "init-status" ; size = 2 ; lambda = status ; }
                                                                            { name = "release-typeOf" ; size = 1 ; lambda = lambda ; }
                                                                            { name = "release-standard-output" ; size = 1 ; lambda = hash ; }
                                                                            { name = "release-standard-error" ; size = 1 ; lambda = hash ; }
                                                                            { name = "release-status" ; size = 2 ; lambda = status ; }
                                                                        ] ;
                                                            in { } ;
                                                    in
                                                        lib
                                                            {
                                                                at =
                                                                    pkgs.writeShellScript
                                                                        "at"
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/cat | ${ pkgs.bash }/bin/bash &
                                                                        '' ;
                                                                resource = "ae5a1299ab2a1c89f07bf9a6ef750fa4a518754d174f230493d4351f2e43d060b69c2079e75f60e62d24e178552a074c42a0ca449fcddf9716a3a95d44426299" ;
                                                                target = "e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d" ;
                                                                temporary =
                                                                    {
                                                                        temporary = temporary ;
                                                                        util =
                                                                            {
                                                                                post =
                                                                                    {
                                                                                        expected =
                                                                                            script :
                                                                                                {
                                                                                                    init =
                                                                                                        script
                                                                                                            {
                                                                                                                executable = pkgs.writeShellScript "expected" ( builtins.readFile ( self + "/scripts/test/util/post/expected/init.sh" ) ) ;
                                                                                                                sets =
                                                                                                                    {
                                                                                                                        ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                        SED = "${ pkgs.gnused }/bin/sed" ;
                                                                                                                        TEMPLATE = self + "/templates/expected/method.yaml" ;
                                                                                                                    } ;
                                                                                                            } ;
                                                                                                } ;
                                                                                        observed =
                                                                                            script :
                                                                                                {
                                                                                                    init =
                                                                                                        script
                                                                                                            {
                                                                                                                executable = pkgs.writeShellScript "observed" ( builtins.readFile ( self + "/scripts/test/util/post/observed/init.sh" ) ) ;
                                                                                                                sets =
                                                                                                                    {
                                                                                                                        BASENAME = "${ pkgs.coreutils }/bin/basename" ;
                                                                                                                        CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                        CHMOD = "${ pkgs.coreutils }/bin/chmod" ;
                                                                                                                        ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                        FIND = "${ pkgs.findutils }/bin/find" ;
                                                                                                                        SED = "${ pkgs.gnused }/bin/sed" ;
                                                                                                                        YQ = "${ pkgs.yq }/bin/yq" ;
                                                                                                                    } ;
                                                                                                            } ;
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
                                                                                arguments = "${ pkgs.coreutils }/bin/timeout 10s ${ value } ${ builtins.elemAt path 3 }" ;
                                                                                echo = builtins.concatStringsSep "" [ "$" "{" "ECHO" "}" ] ;
                                                                                standard-input =
                                                                                    let
                                                                                        standard-input = builtins.elemAt path 4 ;
                                                                                        in if standard-input == "_" then arguments else "${ pkgs.coreutils }/bin/timeout 10s ${ echo } ${ standard-input } | ${ arguments }" ;
                                                                                status =
                                                                                    let
                                                                                        status = builtins.elemAt path 2 ;
                                                                                        # in if status == "0" then "ALPHA=$( ${ standard-input } ) && ${ echo } \"paste: ${ builtins.substring 0 8 ( builtins.hashString "sha512" ( builtins.concatStringsSep "/" path ) ) }\" >> ${ builtins.concatStringsSep "" [ "$" "{" "ALPHA" "}" ] }" else "! ${ standard-input }" ;
                                                                                        in if status == "0" then "${ echo } \"paste: ${ builtins.substring 0 8 ( builtins.hashString "sha512" ( builtins.concatStringsSep "/" path ) ) }\" >> $( ${ standard-input } )" else "! ${ standard-input }" ;
                                                                                in [ "#" ( builtins.concatStringsSep " " [ "# ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] }" ( builtins.concatStringsSep " / " path ) ">&2" ] ) status status ]
                                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a set nor a string." ;
                                                                 in
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                            ${ pkgs.coreutils }/bin/echo $out &&
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
                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "observed-internal" ( builtins.concatStringsSep " &&\n" ( builtins.concatLists [ ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "resources" "temporary" ] ) resources.temporary.temporary ) ) ) [ "${ pkgs.coreutils }/bin/sleep 15s" "${ pkgs.findutils }/bin/find /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${ pkgs.gnugrep }/bin/grep ^temporary {} \\; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/count.mid" ] ] ) ) } $out/bin/observed-internal.sh &&
                                                                            makeWrapper $out/bin/observed-internal.sh $out/bin/observed-internal --set ECHO ${ pkgs.coreutils }/bin/echo &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test-external.sh" } $out/bin/test-external.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/test-external.sh &&
                                                                            makeWrapper $out/bin/test-external.sh $out/bin/test-external --set BASH_UNIT ${ pkgs.bash_unit }/bin/bash_unit --set DIFF ${ pkgs.diffutils }/bin/diff --set ECHO ${ pkgs.coreutils }/bin/echo --set EXPECTED ${ self + "/expected" } --set FIND ${ pkgs.findutils }/bin/find --set OBSERVED $out/observed --set TEST_INTERNAL ${ self + "/scripts/test/util/test-internal.sh" } &&
                                                                            $out/bin/observed-external &&
                                                                            ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&
                                                                            ${ pkgs.coreutils }/bin/touch $out/observed/.gitignore &&
                                                                            $out/bin/test-external &&
                                                                            exit ${ builtins.toString 0 }
                                                                    '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
