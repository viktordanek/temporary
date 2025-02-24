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
                                                                                path : name : value : ( builtins.trace "1890b601-525a-4c6c-8b96-56ad1fff226d ${ builtins.typeOf value }" (
                                                                                    if builtins.typeOf value == "lambda" then builtins.getAttr "constructor" ( builtins.trace "b2369522-6d1d-4a19-b074-24a88e7da261 ${ builtins.typeOf ( value null null ) }" ( value null null ) )
                                                                                    else if builtins.typeOf value == "list" then
                                                                                        let
                                                                                            generator = index : mapper ( ( builtins.trace "41d6455f-c789-43df-8691-95967d8f65e8" ( builtins.concatLists [ path [ name ] ] ) ) ) index ( builtins.elemAt value index ) ;
                                                                                            in builtins.trace "8620a20c-930f-4c2b-918c-775403992ae2" ( builtins.concatLists ( builtins.genList generator ( builtins.length value ) ) )
                                                                                    else if builtins.typeOf value == "set" then builtins.trace "2857663a-53c9-4dc5-acf6-5817967d9d47" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.trace "9791f687-49c5-411a-9e78-8aad6459c6c2" ( builtins.concatLists [ path [ name ] ] ) ) ) value ) ) )
                                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.trace "58c09677-6e48-4ae2-95e8-3038dd9cfe14" ( builtins.concatLists [ path [ name ] ] ) ) } for construction is not lambda, list, nor set but ${ builtins.typeOf value }." ) ) ;
                                                                            in builtins.trace "a2314717-ff84-4594-bc09-67ea0abc39cd" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) ( builtins.trace "defined dependencies for constructors" dependencies ) ) ) ) ;
                                                                    in builtins.concatStringsSep " &&\n\t" ( builtins.trace "before constructors" constructors ) ;
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
                                                            hash = builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.fromJSON ( builtins.trace "4bdf0fa0-e0ba-4d51-8a21-693ea81997a4 ${ builtins.typeOf path } ${ builtins.typeOf name } ${ name }" ( builtins.concatLists [ path [ name ] ] ) ) ) ) ;
                                                            store = builtins.concatStringsSep "" [ "$" "{" "STORE" "}" ] ;
                                                            in
                                                                ignore : builtins.trace "3ab39c2f-f564-488a-95bb-1755b73ebe19"
                                                                    {
                                                                        constructor =
                                                                            [
                                                                                ( builtins.trace "c537164b-f6a2-4377-97e6-e6fbe88e904a" "${ pkgs.coreutils }/bin/mkdir ${ store }/${ hash }" )
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
                                                                if builtins.typeOf value == "lambda" then builtins.concatStringsSep "/" [ derivation "temporary" ( builtins.getAttr "hash" ( value null ) ) "setup" ]
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