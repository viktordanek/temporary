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
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    installPhase =
                                                        let
                                                            constructor =
                                                                let
                                                                    constructors =
                                                                        let
                                                                            mapper =
                                                                                path : name : value :
                                                                                    if builtins.typeOf value == "lambda" then builtins.getAttr "constructor" value null
                                                                                    else if builtins.typeOf value == "list" then
                                                                                        let
                                                                                            generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                                            in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                                    else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for construction is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                                            in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) ( builtins.trace "defined dependencies for constructors" dependencies ) ) ) ;
                                                                    in builtins.concatStringsSep " &&\n\t" constructors ;
                                                            in
                                                                builtins.trace "defined constructor"
                                                               ''
                                                                   ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                       makeWrapper ${ builtins.toFile "constructor.sh" constructor } $out/constructor --set MAKE_WRAPPER ${ pkgs.buildPackages.makeWrapper } --set STORE $out &&
                                                                       ${ builtins.trace "after map" "${ pkgs.coreutils }/bin/mkdir $out/temporary" } &&
                                                                       $out/constructor
                                                                '' ;
                                                    name = "temporary-implementation" ;
                                                    src = ./. ;
                                                } ;
                                        dependencies =
                                            let
                                                lambda =
                                                    path : name : value : ignore :
                                                        let
                                                            hash = builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.fromJSON builtins.concatLists [ path [ name ] ] ) ) ;
                                                            store = builtins.concatStringsSep "" [ "$" "{" "STORE" "}" ] ;
                                                            in
                                                                ignore :
                                                                    {
                                                                        constructor =
                                                                            builtins.concatLists
                                                                                [
                                                                                    "${ pkgs.coreutils }/bin/mkdir ${ store }/${ hash }"
                                                                                ] ;
                                                                        hash = hash ;
                                                                        value = value ;
                                                                    } ;
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then lambda path name value
                                                        else if builtins.typeOf value == "list" then
                                                            let
                                                                generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                in builtins.genList generator ( builtins.length value )
                                                        else if builtins.typeOf value == "null" then lambda path name ( x : { } )
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) value
                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for initialization is not lambda, list, null, nor set but ${ builtins.typeOf value }." ;
                                                in builtins.mapAttrs ( mapper [ ] ) ( builtins.trace "temporary is defined" ( if builtins.typeOf temporary == "set" then temporary else builtins.throw "The temporary must be a set." ) ) ;
                                        harvest =
                                            {
                                                derivation =
                                                    let
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then builtins.concatStringsSep "/" ( [ derivation "temporary" ( builtins.getAttr "hash" ( value null ) ) "setup" ] )
                                                                else if builtins.typeOf value == "list" then
                                                                    let
                                                                        generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                        in builtins.genList generator ( builtins.length value )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) value
                                                                else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for harvest is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                        in builtins.mapAttrs ( mapper [ ] ) ( builtins.trace "defined dependencies for harvest" dependencies ) ;
                                            } ;
                                        in harvest ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        pkgs.stdenv.mkDerivation
                                            {
                                                installPhase =
                                                    let
                                                        resources =
                                                            {
                                                                foobar =
                                                                    lib
                                                                        {
                                                                            caller = self ;
                                                                            initializer = 66 ;
                                                                            resource-mask = "temporary.foobar.XXXXXXXX" ;
                                                                            standard-error = 67 ;
                                                                            temporary =
                                                                                {
                                                                                    foobar = shell-script : { } ;
                                                                                } ;
                                                                        } ;
                                                            } ;
                                                        in
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources.foobar.derivation.foobar } &&
                                                                    exit 68
                                                            '' ;
                                                name = "temporary-checks" ;
                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                src = ./. ;
                                            } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}