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
                                                                                    if builtins.typeOf release == "lambda" then init
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
                                                                                        else [ ( computed.post path name "post.sh" ) ]
                                                                                    )
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/setup.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh ${ builtins.concatStringsSep "/" path }/${ name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set ECHO ${ pkgs.coreutils }/bin/echo --set ERROR ${ builtins.toString temporary-initialization-error } --set INIT ${ builtins.concatStringsSep "/" path }/${ name }/init.sh --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ builtins.concatStringsSep "/" path }/${ name }/release --set TAIL ${ pkgs.coreutils }/bin/tail --set TEARDOWN_ASYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch --set TEE ${ pkgs.coreutils }/bin/tee --set TARGET ${ target }"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-asynch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set ECHO ${ pkgs.coreutils }/bin/echo --set NICE ${ pkgs.coreutils }/bin/nice  --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-synch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh ${ builtins.concatStringsSep "/" path }${ name }/teardown-synch  --set CHMOD ${pkgs.coreutils }/bin/chmod --set ECHO ${pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock  --set MV ${pkgs.coreutils }/bin/mv --set RM ${pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail"
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
                                                                    ${ pkgs.coreutils }/bin/tee &
                                                                '' ;
                                                        target = "add0b557a39c95e62d90f6ee00243487501a1608dc74ed508b06e73aadef20a6dc04c5cb148832019ae0e15a45808347f2310fe7093a8c86937f5a26f985daef" ;
                                                        temporary =
                                                            {
                                                                temporary =
                                                                    script :
                                                                        {
                                                                            init =
                                                                                script
                                                                                    {
                                                                                        executable =
                                                                                            pkgs.writeShellScript
                                                                                                "temporary"
                                                                                                ''
                                                                                                    # FOUND ME
                                                                                                '' ;
                                                                                        sets = { ECHO = "${ pkgs.coreutils }/bin/echo" ; TEE="${ pkgs.coreutils }/bin/tee" ; } ;
                                                                                    } ;
                                                                            # init = script { executable = pkgs.writeShellScript "temporary" ( self + "scripts/test/temporary/init.sh" ) ; sets = { ECHO = "${ pkgs.coreutils }/bin/echo" ; TEE="${ pkgs.coreutils }/bin/tee" ; } ; } ;
                                                                            release = script { executable = pkgs.writeShellScript "temporary" ( self + "scripts/test/temporary/release.sh" ) ; sets = { ECHO = "${ pkgs.coreutils }/bin/echo" ; } ; } ;
                                                                            post = script { executable = pkgs.writeShellScript "temporary" ( self + "scripts/test/temporary/post.sh" ) ; sets = { CAT = "${ pkgs.coreutils }/bin/cat" ; } ; } ;
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
                                                                    if TEMPORARY=$( ${ resources.temporary.temporary } arguments )
                                                                    then
                                                                        ${ pkgs.coreutils }/bin/echo TEMPORARY: &&
                                                                            ${ pkgs.coreutils }/bin/echo ${ resources.temporary.temporary } &&
                                                                            ${ pkgs.coreutils }/bin/echo $TEMPORARY &&
                                                                            ${ pkgs.coreutils }/bin/echo FIND &&
                                                                            ${ pkgs.findutils }/bin/find $( ${ pkgs.coreutils }/bin/dirname $TEMPORARY ) &&
                                                                            ${ pkgs.coreutils }/bin/echo INIT STATUS &&
                                                                            ${ pkgs.coreutils }/bin/echo $( ${ pkgs.coreutils }/bin/dirname $TEMPORARY )/init.status &&
                                                                            ${ pkgs.coreutils }/bin/cat $( ${ pkgs.coreutils }/bin/dirname $TEMPORARY )/init.status &&
                                                                            ${ pkgs.coreutils }/bin/echo DEBUG &&
                                                                            ${ pkgs.coreutils }/bin/echo /build/debug &&
                                                                            ${ pkgs.coreutils }/bin/cat /build/debug
                                                                    else
                                                                        ${ pkgs.coreutils }/bin/echo NOT TODAY
                                                                    fi &&
                                                                    exit 1
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
