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
                                    store ? "bb8a0f30f43c48f4abcc70b9be4611e9dac31a5768c24383111b1240c35e22a4a3bac382ded1b154559b64424789499391d1b73cc3ad92157c4a5f341e9689e4" ,
                                    temporary ? { }
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
                                                                            release ? builtins.null
                                                                        } :
                                                                            {
                                                                                init =
                                                                                    if builtins.typeOf init == "null" then builtins.null
                                                                                    else if builtins.typeOf init == "path" then init
                                                                                    else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a null nor a path but a ${ builtins.typeOf init }." ;
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
                                                                                                "makeWrapper"
                                                                                                ( "${ builtins.concatStringsSep "/" path }/${ name }/${ binary }" )
                                                                                                (
                                                                                                    if builtins.typeOf executable == "path" then executable
                                                                                                    else builtins.throw "The executable is not a path but a ${ builtins.typeOf executable }"
                                                                                                )
                                                                                                (
                                                                                                    if
                                                                                                        builtins.typeOf sets == "set" && builtins.all ( s : builtins.typeOf s == "string" ) ( builtins.attrValues sets )
                                                                                                        then
                                                                                                        builtins.attrValues ( builtins.mapAttrs ( name : value : [ "--set" "'${ name }'" "'${ value }'" ] ) )
                                                                                                    else builtins.throw "The sets is not a set of strings."
                                                                                                )
                                                                                            ]
                                                                                    ) ;
                                                                    in ignore : value script ; # identity ( value script ) ;
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
                                                                                    ''
                                                                                        ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }/${ name }
                                                                                    ''
                                                                                    (
                                                                                        if computed.init == null then [ ]
                                                                                        else computed.init path name "init"
                                                                                    )
                                                                                ]
                                                                    else if builtins.typeOf value == "set" then
                                                                        builtins.concatLists
                                                                            [
                                                                                ''
                                                                                    ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }
                                                                                ''
                                                                            ]
                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
                                                            in
                                                        builtins.trace "HI ${ builtins.concatStringsSep " ; " ( builtins.attrNames ( dependencies.temporary.directory builtins.null ) ) }" (
                                                        ''
                                                            ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                export ${ store }=$out
                                                        '' ) ;
                                                } ;
                                        in
                                            let
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then "${ builtins.concatStringsSep "/" path }/${ name }"
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
                                                        temporary =
                                                            {
                                                                directory =
                                                                    script :
                                                                        {
                                                                            temporary = script { } ;
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
                                                                    ${ pkgs.coreutils }/bin/echo ${ builtins.typeOf resources } &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ builtins.concatStringsSep " ; " ( builtins.attrNames resources ) } &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ builtins.typeOf resources.temporary } &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ builtins.concatStringsSep " ; " ( builtins.attrNames resources.temporary ) } &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ builtins.typeOf resources.temporary.directory } &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources.temporary.directory } &&
                                                                    exit 1
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
