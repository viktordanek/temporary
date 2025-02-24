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
                                    at ? "/run/wrappers/bin/at" ,
                                    caller ,
                                    error-initializer ? 64 ,
                                    error-standard-error ? 65 ,
                                    resource-mask ? "temporary.XXXXXXXX" ,
                                    temporary ? { } ,
                                    whitelist ? [ ]
                                } :
                                    let
                                        lib =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    installPhase =
                                                        let
                                                            constructor =
                                                                let
                                                                    constructors =
                                                                        let
                                                                            dependencies =
                                                                                let
                                                                                    lambda =
                                                                                        path : name : value :
                                                                                            [
                                                                                                (
                                                                                                    index :
                                                                                                        {
                                                                                                            index = index ;
                                                                                                            path = builtins.concatLists [ path [ name ] ] ;
                                                                                                            value = value ;
                                                                                                        }
                                                                                                )
                                                                                            ] ;
                                                                                    mapper =
                                                                                        path : name : value :
                                                                                            if builtins.typeOf value == "lambda" then lambda path name value
                                                                                            else if builtins.typeOf value == "list" then
                                                                                                let
                                                                                                    generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                                                    in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                                            else if builtins.typeOf value == "null" then lambda path name { }
                                                                                            else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) temporary ) )
                                                                                            else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } is not lambda, list, null, nor set but ${ builtins.typeOf value }."
                                                                                    in builtins.mapAttr ( mapper [ ] ) temporary ;
                                                                            mapper =
                                                                                { index , path , value } :
                                                                                    ''
                                                                                        ${ pkgs.coreutils }/bin/mkdir $out/${ builtins.toString index }
                                                                                    '' ;
                                                                            in builtins.map mapper dependencies ;
                                                            in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ [ "source ${ builtins.concatStringsSep "" [ "$" "{" "MAKE_WRAPPER" "}" ] }" ] constructors ] ) ;
                                                    in
                                                       ''
                                                           ${ pkgs.coreutils }/bin/mkdir $out &&
                                                               makeWrapper ${ builtins.writeFile "constructor.sh" constructor } $out/constructor --set MAKE_WRAPPER ${ pkgs.buildPackages.makeWrapper } &&
                                                               ${ pkgs.coreutils }/bin/mkdir $out/temporary &&
                                                               $out/constructor
                                                        '' ;
                                                    name = "temporary-implementation" ;
                                                    src = ./. ;
                                        in
                                            {
                                                checks.testLib =
                                                    pkgs.stdenv.mkDerivation
                                                        {
                                                            installPhase =
                                                                let
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/mkdir $out
                                                                        '' ;
                                                            name = "temporary-checks" ;
                                                            nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                            src = ./. ;
                                                        } ;
                                                lib = lib ;
                                            }
                    in flake-utils.lib.eachDefaultSystem fun ;
}
