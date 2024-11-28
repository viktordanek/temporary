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
                                    debug ? "/dev/null" ,
                                    invalid-script-throw ? value : "b01a14bb7131a8e7bd216e451e4203a123c0b8df5e15dbf52ab6aea134f9eebc33572e663103bf60fcdb71ea6761d8bcb2cc6f8a9170165b5023138f05d1b172:  ${ builtins.typeOf value }" ,
                                    invalid-temporary-throw ? value : "5a675ed32421e1ca7f99ad18413cc5ae2b4bde11700e6f0cf77e326c1af9767cc27a87ecb806979701239425790efeb06bc3e3e65d501fdc799a0a685ecf4ad2:  ${ builtins.typeOf value }" ,
                                    mask-reference ? "/tmp/*.ce6807e0feab65315f584831e5721245e6f6280d" ,
                                    out ? "e07240d0b9209443a0219b9486f9c4e1fbbc3a3f58875105789ea8210f114bbf2c4d420efff457da21738b8cd00c5ae2c0935fc17ca575260d51d0903797f82d" ,
                                    resource ? "bf01d7a5dfd1ad0c7bd4a8ecba39063384d09898d821698c82691d8f28d9aa1067e4abeff96cf3641ab311d22cb5937b9429b6ca0c151d6365fbe0025c575f01" ,
                                    secondary ? { } ,
                                    scripts ? secondary : { } ,
                                    target ? "e4608844be8ee356014f54c180b70cce7b8f1c34d9b73a8f3d9f516135ef5b889f9bd2ca55f4d1d66d3b81ed58f2c90a5e7ff082fa3c704339c0772ead4c644a" ,
                                    temporary ? { } ,
                                    temporary-hold ? 0 ,
                                    temporary-init-error-code ? 64 ,
                                    temporary-resource-directory ? "${ pkgs.coreutils }/bin/mktemp --directory -t XXXXXXXX.ce6807e0feab65315f584831e5721245e6f6280d" ,
                                    temporary-broken-directory ? "${ pkgs.coreutils }/bin/mktemp --dry-run -t XXXXXXXX.62f7ff21050af91d081b577d4ce480f8c94b98e1"
                                } :
                                    pkgs.stdenv.mkDerivation
                                        {
                                            name = "temporary-implementation" ;
                                            nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                            src = ./. ;
                                            installPhase = "${ self }/scripts/implementation/install-phase.sh" ;
                                        } ;
                            pkgs = import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
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
