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
                                                                                    if builtins.typeOf value == "lambda" then builtins.getAttr "constructor" ( value null null )
                                                                                    else if builtins.typeOf value == "list" then
                                                                                        let
                                                                                            generator = index : mapper ( ( builtins.trace "41d6455f-c789-43df-8691-95967d8f65e8" ( builtins.concatLists [ path [ name ] ] ) ) ) index ( builtins.elemAt value index ) ;
                                                                                            in builtins.trace "8620a20c-930f-4c2b-918c-775403992ae2" ( builtins.concatLists ( builtins.genList generator ( builtins.length value ) ) )
                                                                                    else if builtins.typeOf value == "set" then builtins.trace "2857663a-53c9-4dc5-acf6-5817967d9d47" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.trace "9791f687-49c5-411a-9e78-8aad6459c6c2" ( builtins.concatLists [ path [ name ] ] ) ) ) value ) ) )
                                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.trace "58c09677-6e48-4ae2-95e8-3038dd9cfe14" ( builtins.concatLists [ path [ name ] ] ) ) } for construction is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                                            in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) ( builtins.trace "defined dependencies for constructors" dependencies ) ) ) ;
                                                                    in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ [ "source ${ builtins.concatStringsSep "" [ "$" "{" "MAKE_WRAPPER" "}" ] }/nix-support/setup-hook" ] constructors ] ) ;
                                                            in
                                                                builtins.trace "defined constructor"
                                                               ''
                                                                   ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                        ${ pkgs.coreutils }/bin/cat ${ builtins.toFile "constructor.sh" constructor } > $out/constructor.sh &&
                                                                        ${ pkgs.coreutils }/bin/chmod 0500 $out/constructor.sh &&
                                                                        makeWrapper $out/constructor.sh $out/constructor --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set MAKE_WRAPPER ${ pkgs.buildPackages.makeWrapper } --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set STORE $out &&
                                                                        ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                        $out/constructor
                                                                '' ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    name = "temporary-implementation" ;
                                                    src = ./. ;
                                                } ;
                                        dependencies =
                                            let
                                                lambda =
                                                    path : name : value : ignore :
                                                        let
                                                            hash = builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.toJSON ( builtins.trace "4bdf0fa0-e0ba-4d51-8a21-693ea81997a4" ( builtins.concatLists [ path [ name ] ] ) ) ) ) ;
                                                            store = builtins.concatStringsSep "" [ "$" "{" "STORE" "}" ] ;
                                                            in
                                                                ignore :
                                                                    {
                                                                        constructor =
                                                                            [
                                                                                "${ builtins.concatStringsSep "" [ "$" "{" "MKDIR" "}" ] } ${ store }/bin/${ hash }"
                                                                                "${ builtins.concatStringsSep "" [ "$" "{" "CAT" "}" ] } ${ self + "/scripts/implementation/setup.sh" } > ${ store }/bin/${ hash }/setup.sh"
                                                                                "${ builtins.concatStringsSep "" [ "$" "{" "CHMOD" "}" ] } 0555 ${ store }/bin/${ hash }/setup.sh"
                                                                                "makeWrapper ${ store }/bin/${ hash }/setup.sh ${ store }/bin/${ hash }/setup"
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
                                                                if builtins.typeOf value == "lambda" then builtins.concatStringsSep "/" [ derivation "bin" ( builtins.getAttr "hash" ( value null null ) ) "setup" ]
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