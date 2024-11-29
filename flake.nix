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
                                    target ? "accc6302a7852e378f2f672c66cfd30b2d442fd2be68a77374bbd3282341cb4fd99eded94e66ec8802fccc4e933451c4d0bdaff782119408267594f6f194bfce"
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
                                                                            mapper =
                                                                                path : name : value :
                                                                                    if builtins.typeOf value == "path" then string path name ( builtins.import value )
                                                                                    else if builtins.typeOf value == "set" then
                                                                                        ''
                                                                                            ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }
                                                                                        ''
                                                                                        ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                                    else if builtins.typeOf value == "string" then string path name value
                                                                                    else builtins.throw "The script defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a path, set, or string but is a ${ builtins.typeOf value }." ;
                                                                            string =
                                                                                path : name : value :
                                                                                    [
                                                                                        ''
                                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript name value } ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }/${ name }.sh
                                                                                        ''
                                                                                        ''
                                                                                            makeWrapper ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }/${ name }.sh ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }/${ name } --prefix PATH ""
                                                                                        ''
                                                                                    ] ;
                                                                            in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) scripts ) ) ;
                                                                } ;
                                                            in "export ${ target }=$out && ${ pkgs.bash }/bin/bash ${ self }/scripts/implementation/install-phase.sh && ${ builtins.concatStringsSep "&& " dependencies.scripts }" ;
                                                } ;
                                        in
                                            let
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) value
                                                        else if builtins.typeOf value == "string" then "${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/${ builtins.concatStringsSep "/" path }/${ name }/${ value }"
                                                        else builtins.throw "The script defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a set nore a string but a ${ builtins.typeOf value }."
                                                    in
                                                        {
                                                            scripts = scripts : builtins.mapAttrs ( mapper [ "scripts" ] ) scripts ;
                                                        } ;
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
