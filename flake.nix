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
                                                                                        "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }"
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
                                                                temporary = temporary ;
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
                                                retester =
                                                    let
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then
                                                                    let
                                                                        stuff = "${ pkgs.coreutils }/bin/echo \"HI AAA${ builtins.toString ( builtins.length path ) }BBB:  ${ builtins.concatStringsSep " \ " path }\"" ;
                                                                        command = "\${ ${ builtins.concatStringsSep "." path } ${ builtins.elemAt path 7 } \}" ;
                                                                        init-typeOf = if builtins.elemAt path 0 == "" then "if ${ command } ; then ${ pkgs.coreutils }/bin/echo /build/temporary/observed/debug ; fi" else "${ pkgs.coreutils }/bin/echo PASTE=e83f3c739d0d155db02acce1e98e6b2ac3d0c0c9d965f80118e122401f74e33ff42942716c729ce8e45ab9ecd2d97ef868bffefc0fae56d79efe5c9438a44f1c > $( ${ standard-input } )" ;
                                                                        standard-input = if builtins.elemAt path 8 == "" then "${ command }" else "${ pkgs.coreutils }/bin/echo ${ builtins.elemAt path 8 } | ${ command }" ;
                                                                        in [ standard-input ]
                                                                else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                else builtins.throw "The test value at ${ builtins.concatStringsSep "/" path }/name is neither a lambda or a set but a ${ builtins.typeOf value }." ;
                                                        in builtins.concatStringsSep " &&\n" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) temporary ) ) ) ;
                                                    temporary =
                                                        {
                                                            # INIT TYPEOF X3
                                                            lambda =
                                                                {
                                                                    # RELEASE TYPEOF X3
                                                                    lambda =
                                                                        {
                                                                            # INIT STANDARD OUTPUT X2
                                                                            c1a1d44e9462dc604a7606aec582efb4520ef7eccf6f554e71bbbd0418d15da535cfe1b35a1c80b07ebd2f063199517e338cffb9fc7a83d9a4448be282ed2ef8 =
                                                                                {
                                                                                    # INIT STANDARD ERROR X2
                                                                                    cfe4dd624ceaacae4a8a0bb7d3f264891f8f6875f4bac31d13217ae56f4c51ec15c7f16a55c062fbe7ed195b75ec8fd834048f47505147dd9a60e7433eac0690 =
                                                                                        {
                                                                                            # RELEASE STANDARD OUTPUT X2
                                                                                            e4461e42ac0b68527fa277c4b2e469e374df02c406490c61a22005d27822392e94f07d435924911c83cc74c5b08cc40c7402668e0b55d4b32405f5dea8fd12c1 =
                                                                                                {
                                                                                                    # RELEASE STANDARD ERROR X2
                                                                                                    d469c6b44fed89a5a86b1d9fe50a6039fcba8c6e85cfb7f4bf41c4d3b19f026f719df09cf70f8d6a63773edd2dc8a4223696189b46e144839635d0b78aabbd59 =
                                                                                                        {
                                                                                                            # INIT EXIT CODE X2
                                                                                                            "0" =
                                                                                                                {
                                                                                                                    # RELEASE EXIT CODE X2
                                                                                                                    "0" =
                                                                                                                        {
                                                                                                                            # ARGUMENT X2
                                                                                                                            yes =
                                                                                                                                {
                                                                                                                                    # STANDARD INPUT X2
                                                                                                                                    a8ad9cc2bff00c3e8ba9922b1525482a452d51c21132762aa403305e7f72f9177af81d432ba96f3b7344389d5445ed03546c396d01eed6056a3b2725f1cbc9a5 =
                                                                                                                                        script :
                                                                                                                                            {
                                                                                                                                                init = script { executable = pkgs.writeShellScript "temporary-init" ( builtins.readFile ( self + "/scripts/test/temporary/init.sh" ) ) ; sets = harvest : { CAT = "${ pkgs.coreutils }/bin/cat" ;  CUT = "${ pkgs.coreutils }/bin/cut" ; ECHO = "${ pkgs.coreutils }/bin/echo" ; INIT_EXIT_CODE = "0" ; SHA512SUM = "${ pkgs.coreutils }/bin/sha512sum" ; TEE="${ pkgs.coreutils }/bin/tee" ; TOKEN = harvest.temporary.util.token ; VARIABLE = "7a09c789507b0564945c2fce0e0e42c6e574dd7a1ef2201b0344ca57a4fd65f3e7347a49622ed16793611eb9ae3c54cdf4d52cf3f04f0be3da814b359db159fb" ; } ; } ;
                                                                                                                                                release = script { executable = pkgs.writeShellScript "temporary-release" ( builtins.readFile ( self + "/scripts/test/temporary/release.sh" ) ) ; sets = harvest : { CAT = "${ pkgs.coreutils }/bin/cat" ;  CUT = "${ pkgs.coreutils }/bin/cut" ;ECHO = "${ pkgs.coreutils }/bin/echo" ; RELEASE_EXIT_CODE = "0" ; SHA512SUM = "${ pkgs.coreutils }/bin/sha512sum" ; TEE="${ pkgs.coreutils }/bin/tee" ; TOKEN = harvest.temporary.util.token ; VARIABLE = "c8cd7fff64e375b956a9385eb9cfeae43187d906f44a3f76082c8e8708225511c0ccee3756df1b3ab8024ebaf75b1138eef8d65ec536eaf8ac5b1b7a11b51038" ; } ; } ;
                                                                                                                                                post = script { executable = pkgs.writeShellScript "temporary-post" ( builtins.readFile ( self + "/scripts/test/temporary/post.sh" ) ) ; sets = { CAT = "${ pkgs.coreutils }/bin/cat" ; CUT = "${ pkgs.coreutils }/bin/cut" ; DIFF = "${ pkgs.diffutils }/bin/diff" ; ECHO = "${ pkgs.coreutils }/bin/echo" ; FLOCK = "${ pkgs.flock }/bin/flock" ; INIT_VARIABLE = "7a09c789507b0564945c2fce0e0e42c6e574dd7a1ef2201b0344ca57a4fd65f3e7347a49622ed16793611eb9ae3c54cdf4d52cf3f04f0be3da814b359db159fb" ; MKDIR = "${ pkgs.coreutils }/bin/mkdir" ; MKTEMP = "${ pkgs.coreutils }/bin/mktemp" ; MV = "${ pkgs.coreutils }/bin/mv" ; PASTE = "e83f3c739d0d155db02acce1e98e6b2ac3d0c0c9d965f80118e122401f74e33ff42942716c729ce8e45ab9ecd2d97ef868bffefc0fae56d79efe5c9438a44f1c" ; RELEASE_VARIABLE = "c8cd7fff64e375b956a9385eb9cfeae43187d906f44a3f76082c8e8708225511c0ccee3756df1b3ab8024ebaf75b1138eef8d65ec536eaf8ac5b1b7a11b51038" ; SED = "${ pkgs.gnused }/bin/sed" ; SHA512SUM = "${ pkgs.coreutils }/bin/sha512sum" ; } ; } ;
                                                                                                                                            } ;
                                                                                                                                } ;
                                                                                                                        } ;
                                                                                                                } ;
                                                                                                        } ;
                                                                                                } ;
                                                                                        } ;
                                                                                } ;
                                                                        } ;
                                                                } ;
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
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/observed.sh" } $out/bin/observed.sh &&
                                                                    ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/observed.sh &&
                                                                    makeWrapper $out/bin/observed.sh $out/bin/observed --set CAT ${ pkgs.coreutils }/bin/cat --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set GREP ${ pkgs.gnugrep }/bin/grep --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set SEQ ${ pkgs.coreutils }/bin/seq --set WC ${ pkgs.coreutils }/bin/wc &&
                                                                    ${ pkgs.coreutils }/bin/mkdir --parents /build/observed/temporary &&
                                                                    ${ pkgs.findutils }/bin/find /build/tmp.* -type f -mindepth 1 -maxdepth 1 -name "target" -exec { pkgs.gnugrep }/bin/grep "^PASTE=e83f3c739d0d155db02acce1e98e6b2ac3d0c0c9d965f80118e122401f74e33ff42942716c729ce8e45ab9ecd2d97ef868bffefc0fae56d79efe5c9438a44f1c\$" \; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/precount &&
                                                                    ${ pkgs.coreutils }/bin/seq 1 1 4 | while read I
                                                                    do
                                                                        $out/bin/observed \
                                                                            ${ resources.temporary.temporary.lambda.lambda.c1a1d44e9462dc604a7606aec582efb4520ef7eccf6f554e71bbbd0418d15da535cfe1b35a1c80b07ebd2f063199517e338cffb9fc7a83d9a4448be282ed2ef8.cfe4dd624ceaacae4a8a0bb7d3f264891f8f6875f4bac31d13217ae56f4c51ec15c7f16a55c062fbe7ed195b75ec8fd834048f47505147dd9a60e7433eac0690.e4461e42ac0b68527fa277c4b2e469e374df02c406490c61a22005d27822392e94f07d435924911c83cc74c5b08cc40c7402668e0b55d4b32405f5dea8fd12c1.d469c6b44fed89a5a86b1d9fe50a6039fcba8c6e85cfb7f4bf41c4d3b19f026f719df09cf70f8d6a63773edd2dc8a4223696189b46e144839635d0b78aabbd59."0"."0".yes.a8ad9cc2bff00c3e8ba9922b1525482a452d51c21132762aa403305e7f72f9177af81d432ba96f3b7344389d5445ed03546c396d01eed6056a3b2725f1cbc9a5 }
                                                                    done &&
                                                                    ${ pkgs.coreutils }/bin/sleep 10s &&
                                                                    ${ pkgs.findutils }/bin/find /build/*.tmp -mindepth 1 -maxdepth 1 -type f -name "target" -exec ${ pkgs.gnugrep }/bin/grep "^PASTE=e83f3c739d0d155db02acce1e98e6b2ac3d0c0c9d965f80118e122401f74e33ff42942716c729ce8e45ab9ecd2d97ef868bffefc0fae56d79efe5c9438a44f1c\$" {} \; | ${ pkgs.coreutils }/bin/wc --lines > /build/observed/temporary/postcount
                                                                    ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test.sh" } $out/bin/test.sh &&
                                                                    ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&
                                                                    export DIFF=${ pkgs.diffutils }/bin/diff &&
                                                                    export EXPECTED=${ self + "/expected" } &&
                                                                    export FIND=${ pkgs.findutils }/bin/find &&
                                                                    export OBSERVED=$out/observed &&
                                                                    if ! ${ pkgs.bash_unit }/bin/bash_unit $out/bin/test.sh
                                                                    then
                                                                        ${ pkgs.coreutils }/bin/echo EXPECTED &&
                                                                         ${ pkgs.findutils }/bin/find $EXPECTED -maxdepth 1  &&
                                                                       ${ pkgs.coreutils }/bin/echo OBSERVED &&
                                                                        ${ pkgs.findutils }/bin/find $OBSERVED -maxdepth 1  &&
                                                                        ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-expectate.sh" } $out/bin/re-expectate.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-expectate.sh &&
                                                                            makeWrapper $out/bin/re-expectate.sh $out/bin/re-expectate --set CP ${ pkgs.coreutils }/bin/cp --set GIT ${ pkgs.git }/bin/git --set OBSERVED $out/observed --set TOUCH ${ pkgs.coreutils }/bin/touch &&
                                                                            ${ pkgs.coreutils }/bin/echo $out/bin/re-expectate
                                                                            exit 1
                                                                    fi &&
                                                                    ${ pkgs.coreutils }/bin/echo '${ retester }' &&
                                                                    exit 2
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
