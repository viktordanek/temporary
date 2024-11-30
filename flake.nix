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
                                                lambda =
                                                    let
                                                        lambda =
                                                            path : name : value :
                                                                let
                                                                    result =
                                                                        let
                                                                            identity =
                                                                                {
                                                                                    init ? builtins.null ,
                                                                                    release ? builtins.null
                                                                                } :
                                                                                    {
                                                                                        init =
                                                                                            if builtins.typeOf init == "null" then init
                                                                                            else if builtins.typeOf init == "path" then ( builtins.import init )
                                                                                            else if builtins.typeOf init == "string" then init
                                                                                            else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a null, path, nor a string but a ${ builtins.typeOf init }." ;
                                                                                    } ;
                                                                            in identity ( value builtins.null ) ;
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then lambda path name value
                                                                else if builtins.typeOf value == "path" then lambda path name ( builtins.import value )
                                                                else if builtins.typeOf value == "set" then
                                                                    builtins.concatLists
                                                                        [
                                                                            [
                                                                               ''
                                                                                   ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }
                                                                               ''
                                                                            ]
                                                                            ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                        ]
                                                                else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda, path, nor a set but is a ${ builtins.typeOf value }." ;
                                                        in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ( builtins.concatStringsSep "" [ "$" "{" store "}" ] ) "temporary" ] ) temporary ) ) ;
                                            } ;
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    name = "temporary-implementation" ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    src = ./. ;
                                                    installPhase =
                                                        ''
                                                            ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                export ${ store }=$out
                                                        '' ;
                                                } ;
                                        in
                                            let
                                                lambda = path : name : "${ builtins.concatStringsSep "/" path }" ;
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then lambda path name
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                        else if builtins.typeOf value == "string" then string path name
                                                        else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a path, set, nor a string but a ${ builtins.typeOf value }." ;
                                                in builtins.mapAttrs ( mapper [ ] ) dependencies ;
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
                                                                null = ignore : { } ;
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
                                                                    exit 1
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
