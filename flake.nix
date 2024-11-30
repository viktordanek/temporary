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
                                    target ? "accc6302a7852e378f2f672c66cfd30b2d442fd2be68a77374bbd3282341cb4fd99eded94e66ec8802fccc4e933451c4d0bdaff782119408267594f6f194bfce" ,
                                    target ? "accc6302a7852e378f2f672c66cfd30b2d442fd2be68a77374bbd3282341cb4fd99eded94e66ec8802fccc4e933451c4d0bdaff782119408267594f6f194bfce" ,
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
                                                                    result =
                                                                        let
                                                                            identity =
                                                                                {
                                                                                    init ? builtins.null ,
                                                                                    release ? builtins.null
                                                                                } :
                                                                                    {
                                                                                        init =
                                                                                            if builtins.typeOf init == "lambda" then init { target = target ; }
                                                                                            else if builtins.typeOf init == "null" then ""
                                                                                            else if builtins.typeOf init == "path"  then builtins.import init { target = target ; }
                                                                                            else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a null, path, nor a string but a ${ builtins.typeOf init }." ;
                                                                                    } ;
                                                                            in identity ( value builtins.null ) ;
                                                                    in
                                                                        [
                                                                            ''
                                                                                ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }/${ name }
                                                                            ''
                                                                            ''
                                                                                ${ pkgs.coreutils }/bin/ln --symbolic ${ builtins.toFile "init" result.init } ${ builtins.concatStringsSep "/" path }/${ name }/init.sh
                                                                            ''
                                                                            ''
                                                                                makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/init.sh ${ builtins.concatStringsSep "/" path }/${ name }/init
                                                                            ''
                                                                        ] ;
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then lambda path name value
                                                                else if builtins.typeOf value == "path" then lambda path name ( builtins.import value )
                                                                else if builtins.typeOf value == "set" then
                                                                    builtins.concatLists
                                                                        [
                                                                            [
                                                                                ''
                                                                                    ${ pkgs.coreutils }/bin/mkdir -p ${ builtins.concatStringsSep "" [ "$" "{" target "}" ] }/scripts/${ builtins.concatStringsSep "/" path }
                                                                                ''
                                                                            ]
                                                                            ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                        ]
                                                                else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda, path, nor a set but is a ${ builtins.typeOf value }." ;
                                                        in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ( builtins.concatStringsSep "" [ "$" "{" target "}" ] ) "temporary" ] ) temporary ) ) ;
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
                                                                export ${ target }=$out &&
                                                                ${ builtins.concatStringsSep " && " ( builtins.concatLists ( builtins.attrValues dependencies ) ) }
                                                        '' ;
                                                } ;
                                        in
                                            let
                                                lambda = path : name : "${ builtins.concatStringsSep "/" path }/${ name }" ;
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then lambda path name
                                                        else if builtins.typeOf value == "path" then lambda path name
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a path, set, nor a string but a ${ builtins.typeOf value }." ;
                                                in
                                                    {
                                                        temporary = builtins.mapAttrs ( mapper [ ( builtins.toString derivation ) "temporary" ] ) temporary ;
                                                    } ;
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
                                                                    ${ pkgs.coreutils }/bin/echo ${ builtins.typeOf resources.temporary } &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ builtins.concatStringsSep " ; " ( builtins.attrNames resources.temporary ) } &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources.temporary.null } &&
                                                                    exit 1
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
