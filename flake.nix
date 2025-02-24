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
                                    initializer ? 64 ,
                                    resource-mask ? "temporary.XXXXXXXX" ,
                                    standard-error ? 65 ,
                                    temporary ? { } ,
                                    whitelist ? [ ]
                                } :
                                    let
                                        lib =
                                            let

                                                in "harvest" ;
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
                                            } ;
                    in flake-utils.lib.eachDefaultSystem fun ;
}