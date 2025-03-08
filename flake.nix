{
    inputs =
        {
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
            shell-scripts.url = "github:viktordanek/shell-scripts" ;
            visitor.url = "github:viktordanke/visitor" ;
        } ;
    outputs =
        { flake-utils , nixpkgs , self , shell-scripts , visitor } :
            let
                fun =
                    system :
                        let
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
                                        _shell-scripts = builtins.getAttr system shell-scripts.lib ;
                                        _visitor = builtins.getAttr system visitor.lib ;
                                        atom =
                                            fun :
                                                _shell-scripts
                                                    {
                                                        mounts = mounts ;
                                                        shell-scripts =
                                                            _visitor
                                                                {
                                                                    lambda = path : value : [ { path = path ; value = fun value ; } ] ;
                                                                    null = path : value : [ { path = path ; value = null ; } ] ;
                                                                }
                                                                {
                                                                    list = path : list : builtins.concatLists [ list ] ;
                                                                    set = path : set : builtins.concatLists ( builtins.attrValues set ) ;
                                                                }
                                                                temporary ;
                                                    } ;
                                        init = atom ( temporary : temporary.init ) ;
                                        mounts =
                                            {
                                                "/temporary/resource" = host-resource-path ;
                                                "/temporary/target" = host-target-path ;
                                            } ;
                                        post = atom ( temporary : temporary.post ) ;
                                        release = atom ( temporary : temporary.release ) ;
                                        temporary_ =
                                            _shell-scripts
                                                {
                                                    mounts = mounts ;
                                                    shell-scripts =
                                                        {
                                                            lambda =
                                                                path : value :
                                                                    let
                                                        }
                                                        {
                                                        }
                                                        temporary ;
                                                } ;
                            in
                                {
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}