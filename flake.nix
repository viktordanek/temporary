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
                                    scripts ? { } ,
                                    scripts-uuid ? "7c9f23ad0b1508d651c6aff49f936fa2ce6e7eef7930e1cc01508ced9a23042ac8ef01baa8d816b4d52f0af38a4b0c27bedaa4c3a16dc66bfdb1421f9d0209a1" ,
                                    target ? 
                                } :
                                    let
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    name = "temporary-implementation" ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    src = ./. ;
                                                    installPhase =
                                                        let
                                                            dependencies =
                                                                {
                                                                    scripts =
                                                                        let
                                                                            lambda =
                                                                                path : name : value :
                                                                                    ""
                                                                            mapper =
                                                                                path : name : value :
                                                                                    if builtins.typeOf value == "lambda" then lambda path name value
                                                                                    else if builtins.typeOf value == "path" then lambda path name ( builtins.import value )
                                                                                    else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                                    else builtins.throw "The script defined at ${ builtins.concatStringsSep " / " path } / ${ name } is a ${ builtins.typeOf value }.  It should be either a lambda, path, or a set." ;
                                                                } ;
                                                            in "${ pkgs.bash }/bin/bash ${ self }/scripts/implementation/install-phase.sh" ;
                                                } ;
                                        in null ;
                            pkgs = import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        let
                                            resource =
                                                lib
                                                    {
                                                        scripts = { } ;
                                                    } ;
                                            in
                                                pkgs.stdenv.mkDerivation
                                                    {
                                                        name = "temporary-test" ;
                                                        nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                        src = ./. ;
                                                        installPhase = "${ pkgs.bash }/bin/bash ${ self }/scripts/test/install-phase.sh" ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
