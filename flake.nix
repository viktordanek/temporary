{
    inputs =
        {
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
            shell-script.url = "github:viktordanek/shell-script" ;
            visitor.url = "github:viktordanek/visitor" ;
        } ;
    outputs =
        { flake-utils , nixpkgs , self , shell-script , visitor } :
            let
                fun =
                    system :
                        let
                            _shell-script = builtins.getAttr system shell-script.lib ;
                            lib =
                                {
                                    at ? "/run/wrappers/bin/at" ,
                                    host-resource-path ,
                                    host-target-path ,
                                    initializer ? 64 ,
                                    standard-error ? 65 ,
                                    temporary ? null ,
                                } :
                                    let
                                        _visitor = builtins.getAttr system visitor.lib ;
                                        in null ;
                            in
                                {
                                    checks =
                                        {
                                            shell-script =
                                                let
                                                    shell-script =
                                                        _shell-script
                                                            {
                                                                shell-scripts =
                                                                    {

                                                                    } ;
                                                            } ;
                                                    in shell-script.tests ;
                                        } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}