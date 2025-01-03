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
                                                                                    if builtins.typeOf post == "lambda" then builtins.trace "YES post is defined and is a lambda" post
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
                                                                                                    else builtins.throw "The executable is neither a null nor a set but a ${ builtins.typeOf executable }"
                                                                                                )
                                                                                                (
                                                                                                    if
                                                                                                        builtins.typeOf sets == "set" && builtins.all ( s : builtins.typeOf s == "string" ) ( builtins.attrValues sets )
                                                                                                        then
                                                                                                            builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( name : value : [ "--set '${ name }' '${ value }'" ] ) sets ) )
                                                                                                    else builtins.throw "The sets is not a set of strings."
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
                                                                                        "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }"
                                                                                        "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }/${ name }"
                                                                                    ]
                                                                                    (
                                                                                        if computed.init == null then [ ]
                                                                                        else [ ( computed.init path name "init.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.release == null then [ ]
                                                                                        else [ ( computed.release path name "release.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.post == null then [ ]
                                                                                        else builtins.trace "YES computed.post is defined and is not null:  ${ ( computed.post path name "post.sh" ) }" [ ( computed.post path name "post.sh" ) ]
                                                                                    )
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/setup.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh ${ builtins.concatStringsSep "/" path }/${ name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo --set ERROR ${ builtins.toString temporary-initialization-error } --set INIT ${ builtins.concatStringsSep "/" path }/${ name }/init.sh --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ builtins.concatStringsSep "/" path }/${ name }/release.sh --set POST ${ builtins.concatStringsSep "/" path }/${ name }/post.sh --set TAIL ${ pkgs.coreutils }/bin/tail --set TEARDOWN_ASYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch --set TEE ${ pkgs.coreutils }/bin/tee --set TARGET ${ target } --set ${ temporary-path } ${ builtins.concatStringsSep "/" ( builtins.map ( n : builtins.elemAt path n ) ( builtins.filter ( n : n > 2 ) ( builtins.genList ( n : n ) ( builtins.length path ) ) ) ) }"
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
                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }"
                                                                                ]
                                                                                ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                            ]
                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
                                                            in
                                                                builtins.concatStringsSep " && " ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "$out" ] ) dependencies ) ) ) ;
                                                } ;
                                        in
                                            let
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then "${ builtins.concatStringsSep "/" path }/${ name }/setup"
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                        else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
                                                in builtins.mapAttrs ( mapper [ ( builtins.toString derivation ) ] ) dependencies ;
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
                                                                    FOOBAR=$( ${ pkgs.coreutils }/bin/tee ) &&
                                                                    ( ${ pkgs.bash }/bin/bash -c "$FOOBAR" & )
                                                                '' ;
                                                        target = "e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d" ;
                                                        temporary =
                                                            {
                                                                temporary =
                                                                    {
                                                                        # ARGUMENT
                                                                        yes =
                                                                            {
                                                                                # STANDARD INPUT
                                                                                yes =
                                                                                    {
                                                                                        # INIT EXIT CODE
                                                                                        "0" =
                                                                                            {
                                                                                                # RELEASE EXIT CODE
                                                                                                "0" =
                                                                                                    script :
                                                                                                        {
                                                                                                            init = script { executable = pkgs.writeShellScript "temporary-init" ( builtins.readFile ( self + "/scripts/test/temporary/init.sh" ) ) ; sets = { ECHO = "${ pkgs.coreutils }/bin/echo" ; INIT_EXIT_CODE = "0" ; STANDARD_ERROR = "7cc1c238512a2ef539d1a449c0bf25a1bdcdb438167863af722155dc077b102edca8b36922989ccc06b31da75551ead3aaea3ef977848874130c121ce0e847a4" ; STANDARD_OUTPUT = "7d67ac07d63ef9145d392a657cec5c22075d8bcc93e910143a468d3833abf05c9fccb36ae6e1ec64344cea62fadd9684d99615ad646c8aa6b6935bf35b0e9266" ; TEE="${ pkgs.coreutils }/bin/tee" ; VARIABLE = "7a09c789507b0564945c2fce0e0e42c6e574dd7a1ef2201b0344ca57a4fd65f3e7347a49622ed16793611eb9ae3c54cdf4d52cf3f04f0be3da814b359db159fb" ; } ; } ;
                                                                                                            release = script { executable = pkgs.writeShellScript "temporary-release" ( builtins.readFile ( self + "/scripts/test/temporary/release.sh" ) ) ; sets = { ECHO = "${ pkgs.coreutils }/bin/echo" ; RELEASE_EXIT_CODE = "0" ; } ; } ;
                                                                                                            post = script { executable = pkgs.writeShellScript "temporary-post" ( builtins.readFile ( self + "/scripts/test/temporary/post.sh" ) ) ; sets = { CAT = "${ pkgs.coreutils }/bin/cat" ; MKDIR = "${ pkgs.coreutils }/bin/mkdir" ; } ; } ;
                                                                                                        } ;
                                                                                            } ;
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
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                    export ECHO=${ pkgs.coreutils }/bin/echo &&
                                                                    export MKDIR=${ pkgs.coreutils }/bin/mkdir &&
                                                                    export TEMP_1=${ resources.temporary.temporary.yes.yes."0"."0" } &&\
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/observed.sh" } $out/bin/observed.sh &&
                                                                    ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/observed.sh &&
                                                                    makeWrapper $out/bin/observed.sh $out/bin/observed --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set WC ${ pkgs.coreutils }/bin/wc &&
                                                                    $out/bin/observed &&
                                                                    ${ pkgs.coreutils }/bin/sleep 10s &&
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test.sh" } $out/bin/test.sh &&
                                                                    ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&
                                                                    export DIFF=${ pkgs.diffutils }/bin/diff &&
                                                                    export EXPECTED=${ self + "/expected" } &&
                                                                    export OBSERVED=$out/observed &&
                                                                    if ! ${ pkgs.bash_unit }/bin/bash_unit $out/bin/test.sh
                                                                    then
                                                                        ${ pkgs.coreutils }/bin/cat /build/debug &&
                                                                        # ${ pkgs.findutils }/bin/find /build &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-expectate.sh" } $out/bin/re-expectate.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-expectate.sh &&
                                                                            makeWrapper $out/bin/re-expectate.sh $out/bin/re-expectate --set CP ${ pkgs.coreutils }/bin/cp --set GIT ${ pkgs.git }/bin/git --set OBSERVED $out/observed --set TOUCH ${ pkgs.coreutils }/bin/touch &&
                                                                            ${ pkgs.coreutils }/bin/echo $out/bin/re-expectate
                                                                    fi &&
                                                                    exit 100
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
