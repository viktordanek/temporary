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
                                    target ? "accc6302a7852e378f2f672c66cfd30b2d442fd2be68a77374bbd3282341cb4fd99eded94e66ec8802fccc4e933451c4d0bdaff782119408267594f6f194bfce" ,
                                    temporary-uuid ? "7c9f23ad0b1508d651c6aff49f936fa2ce6e7eef7930e1cc01508ced9a23042ac8ef01baa8d816b4d52f0af38a4b0c27bedaa4c3a16dc66bfdb1421f9d0209a1"
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
                                                                    temporary =
                                                                        let
                                                                            lambda =
                                                                                path : name : value :
                                                                                    [
                                                                                        ''
                                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript name value } ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }/${ name }.sh
                                                                                        ''
                                                                                        ''
                                                                                            makeWrapper ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }/${ name }.sh ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }/${ name } --prefix PATH ""
                                                                                        ''
                                                                                    ] ;
                                                                            mapper =
                                                                                path : name : value :
                                                                                    if builtins.typeOf value == "lambda" then lambda path name value
                                                                                    else if builtins.typeOf value == "path" then lambda path name ( builtins.import value )
                                                                                    else if builtins.typeOf value == "set" then
                                                                                        ''
                                                                                            ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }
                                                                                        ''
                                                                                        ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                                    else builtins.throw "The script defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda, path, nor a set but is a ${ builtins.typeOf value }." ;
                                                                            in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) scripts ) ) ;
                                                                } ;
                                                            in
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                        export ${ target }=$out &&
                                                                        ${ builtins.concatStringsSep " && " dependencies }
                                                                '' ;
                                                } ;
                                        in
                                            let
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "path" then string path name
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) value
                                                        else if builtins.typeOf value == "string" then string path name
                                                        else builtins.throw "The script defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a path, set, nor a string but a ${ builtins.typeOf value }." ;
                                                string = path : name : "${ builtins.concatStringsSep "/" path }/${ name }" ;
                                                    in
                                                        {
                                                            scripts = scripts : builtins.mapAttrs ( mapper [ ( builtins.concatStringsSep "" [ "$" "{" target "}" ] ) "scripts" ] ) scripts ;
                                                        } ;
                            pkgs = import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        let
                                            resources =
                                                lib
                                                    {
                                                    } ;
                                            in
                                                pkgs.stdenv.mkDerivation
                                                    {
                                                        name = "temporary-test" ;
                                                        nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                        src = ./. ;
                                                        installPhase =
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
