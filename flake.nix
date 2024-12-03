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
                                                        script =
                                                            {
                                                                executable ,
                                                                sets ? { }
                                                            } :
                                                                path : name : binary :
                                                                    builtins.concatStringsSep
                                                                        " "
                                                                        (
                                                                            builtins.concatLists
                                                                                [
                                                                                    "makeWrapper"
                                                                                    ( "${ builtins.concatStringsSep "/" path }/${ name }/${ binary }" )
                                                                                    (
                                                                                        if builtins.typeOf executable == "path" then executable
                                                                                        else builtins.throw "The executable is not a path but a ${ builtins.typeOf executable }"
                                                                                    )
                                                                                    (
                                                                                        if
                                                                                            builtins.typeOf sets == "set" && builtins.all ( s : builtins.typeOf s == "string" ) ( builtins.attrValues sets )
                                                                                            then
                                                                                            builtins.attrValues ( builtins.mapAttrs ( name : value : [ "--set" "'${ name }'" "'${ value }'" ] ) )
                                                                                        else builtins.throw "The sets is not a set of strings."
                                                                                    )
                                                                                ]
                                                                        )
                                                                } ;
                                                        lambda =
                                                            path : name : value :
                                                                let
                                                                    identity =
                                                                        {
                                                                            init ? builtins.null ,
                                                                            release ? builtins.null
                                                                        } :
                                                                            {
                                                                                init =
                                                                                    if builtins.typeOf init == "null" then builtins.null
                                                                                    else if builtins.typeOf init == "path" then init
                                                                                    else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a null nor a path but a ${ builtins.typeOf init }." ;
                                                                            } ;
                                                                    in ignore : identity ( value script ) ;
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then lambda path name value
                                                                else if builtins.typeOf value == "null" then lambda path name { }
                                                                else if builtins.typeOf value == "path" then lambda path name ( builtins.import value )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda, null, path, nor a set but is a ${ builtins.typeOf value }." ;
                                                        in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "temporary" ] ) temporary ) ) ;
                                            } ;
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    name = "temporary-implementation" ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    src = ./. ;
                                                    installPhase =
                                                        let
                                                            mapper =
                                                                path : name : value :
                                                                if builtins.typeOf value == "lambda" then
                                                                    let
                                                                        computed = value builtins.null ;
                                                                        in
                                                                            builtins.concatLists
                                                                                [
                                                                                    ''
                                                                                        ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }/${ name }
                                                                                    ''
                                                                                    (
                                                                                        if builtins.typeOf computed.init == "null" then [ ]
                                                                                        else if builtins.typeOf computed.init == "set" then
                                                                                            let
                                                                                                argv0 = computed.init.argv0 ;
                                                                                                executable = computed.init.executable ;
                                                                                                flags = computed.init.flags ;
                                                                                                run-script = computed.init.run-script ;
                                                                                                sets = computed.init.sets ;
                                                                                                unsets = computed.init.unsets ;
                                                                                                in
                                                                                                    builtins.concatStringsSep
                                                                                                        " "
                                                                                                        [
                                                                                                            "writeWrapper"
                                                                                                            "${ builtins.concatStringsSep "/" path }/${ name }/init"
                                                                                                            executable
                                                                                                            argv0
                                                                                                            flags
                                                                                                            sets
                                                                                                            unsets
                                                                                                        ]
                                                                                        else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a null nor a string but is a ${ builtins.typeOf computed.init }."
                                                                                    )
                                                                                ]
                                                                else if builtins.typeOf value == "set" then
                                                                    builtins.concatLists
                                                                        [
                                                                            ''
                                                                                ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }
                                                                            ''
                                                                            ( builtins.concatLists ( builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) ) value )
                                                                        ]
                                                                else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
                                                            in
                                                        ''
                                                            ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                export ${ store }=$out &&
                                                                ${ builtins.concatStringsSep " && " ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ( builtins.concatStringsSep "" [ "$" "{" store "}" ] ) ] ) dependencies ) ) ) }
                                                        '' ;
                                                } ;
                                        in
                                            let
                                                lambda = path : name : "${ builtins.concatStringsSep "/" path }/${ name }" ;
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then lambda path name
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                        else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
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
                                                                directory =
                                                                    script :
                                                                        {
                                                                            init = script { environment = { CORE_UTILS = pkgs.coreutils ; } ; script = self + "./test/directory/init.sh" ; } ;
                                                                        } ;
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
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources } &&
                                                                    exit 1
                                                            '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
