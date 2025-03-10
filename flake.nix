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
                            _visitor = builtins.getAttr system visitor.lib ;
                            lib =
                                {
                                    at ? "/run/wrappers/bin/at" ,
                                    host-path ,
                                    initializer ? 64 ,
                                    standard-error ? 65 ,
                                    temporary ? null ,
                                } :
                                    let
                                        derivation =
                                            _shell-script
                                                {
                                                    mounts = mounts ;
                                                    shell-scripts =
                                                        _visitor
                                                            (
                                                                let
                                                                    lambda =
                                                                        path : value :
                                                                            let
                                                                                point =
                                                                                    let
                                                                                        identity =
                                                                                            {
                                                                                                init ? null ,
                                                                                                release ? null ,
                                                                                                post ? null ,
                                                                                                tests ? null
                                                                                            } :
                                                                                                {
                                                                                                    init = init ;
                                                                                                    release = release ;
                                                                                                    post = post ;
                                                                                                    tests = tests ;
                                                                                                } ;
                                                                                        in identity ( value null ) ;
                                                                                in
                                                                                    if builtins.typeOf point.init == "null" then
                                                                                        if builtins.typeOf point.release == "null" then
                                                                                            if builtins.typeOf point.post == "null" then "makeWrapper ${ util.shell-scripts.setup.false.false.false }"
                                                                                            else ""
                                                                                        else
                                                                                            if builtins.typeOf point.post == "null" then ""
                                                                                            else ""
                                                                                    else
                                                                                        if builtins.typeOf point.release == "null" then
                                                                                            if builtins.typeOf point.post == "null" then ""
                                                                                            else ""
                                                                                        else
                                                                                            if builtins.typeOf point.post == "null" then ""
                                                                                            else "" ;
                                                                    in
                                                                        {
                                                                            lambda = lambda ;
                                                                            null = path : value : lambda path ( { ... } : { } ) ;
                                                                        }
                                                            )
                                                            { }
                                                            temporary ;
                                                } ;
                                        mounts =
                                            {
                                                "/temporary" = host-path ;
                                            } ;
                                        util =
                                            _shell-script
                                                {
                                                    extensions =
                                                        [
                                                            {
                                                                name = "is-interactive" ;
                                                                value = "--run 'export IS_INTERACTIVE=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"  ;
                                                            }
                                                            {
                                                                name = "is-pipe" ;
                                                                value = "--run 'export IS_PIPE=$( if [ -p 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"  ;
                                                            }
                                                            {
                                                                name = "is-file" ;
                                                                value = "--run 'export IS_FILE=$( if [ -f 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'"  ;
                                                            }
                                                            {
                                                                name = "grandparent-pid" ;
                                                                value =  "--run 'export GRANDPARENT_PID=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                                                            }
                                                            {
                                                                name = "parent-pid" ;
                                                                value =  "--run 'export PARENT_PID=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                                                            }
                                                            {
                                                                name = "resource" ;
                                                                value =  name : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                            }
                                                            {
                                                                name = "resource-setup" ;
                                                                value = "--run 'export _RESOURCE=$( ${ pkgs.coreutils }/bin/mktemp --directory --directory /temporary/XXXXXXXX )'" ;
                                                            }
                                                        ] ;
                                                    mounts = mounts ;
                                                    shell-scripts =
                                                        let
                                                            splits =
                                                                splits :
                                                                    builtins.concatStringsSep
                                                                        " "
                                                                        (
                                                                            builtins.concatLists
                                                                                (
                                                                                    builtins.map ( s : if builtins.elemAt s 0 then [ "${ builtins.elemAt s 1 },${ builtins.elemAt s 2 }p" ] else [ ] ) splits
                                                                                )
                                                                        ) ;
                                                            in
                                                                {
                                                                    setup =
                                                                        let
                                                                            fun =
                                                                                init : release : post : ignore :
                                                                                    {
                                                                                        environment =
                                                                                            { grandparent-pid , is-interactive , is-file , is-pipe , parent-pid , resource-setup , self , string , ... } :
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        [
                                                                                                            ( resource-setup )
                                                                                                        ]
                                                                                                        [
                                                                                                            ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                            ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                            ( grandparent-pid )
                                                                                                            ( is-file )
                                                                                                            ( is-interactive )
                                                                                                            ( is-pipe )
                                                                                                            ( string "LN" "${ pkgs.coreutils }/bin/ln" )
                                                                                                        ]
                                                                                                        ( if init then [ ( string "MAKE_WRAPPER_INIT" "makeWrapper ${ init } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/init.sh" ) ] else [ ] )
                                                                                                        ( if post then [ ( string "MAKE_WRAPPER_POST" "makeWrapper ${ post } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/post.sh" ) ] else [ ] )
                                                                                                        ( if release then [ ( string "MAKE_WRAPPER_RELEASE" "makeWrapper ${ release } ${ builtins.concatStringsSep "" [ "$" "{" "RESOURCE" "}" ] }/release.sh" ) ] else [ ] )
                                                                                                        [
                                                                                                            ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                                            ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                                            ( self "TEARDOWN_ASYNCH" ( self : self.teardown-asynch ) )
                                                                                                            ( self "TEARDOWN_SYNCH" ( self : self.teardown-synch.${ release }.${ post } ) )
                                                                                                            ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                                                        ]
                                                                                                    ] ;
                                                                                        script =
                                                                                            let
                                                                                                lines =
                                                                                                    splits
                                                                                                        [
                                                                                                            [ true 1 21 ]
                                                                                                            [ init 23 23 ]
                                                                                                            [ release 26 26 ]
                                                                                                            [ post 29 29 ]
                                                                                                            [ true 31 32 ]
                                                                                                            [ init 34 58 ]
                                                                                                            [ true 60 60 ]
                                                                                                        ] ;
                                                                                                in
                                                                                                    ''
                                                                                                        ${ pkgs.gnused }/bin/sed -n ${ lines } > $out &&
                                                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                                                    '' ;
                                                                                    } ;
                                                                            in
                                                                                {
                                                                                    false =
                                                                                        {
                                                                                            false =
                                                                                                {
                                                                                                    false = fun false false false ;
                                                                                                    true = fun false false true ;
                                                                                                } ;
                                                                                            true =
                                                                                                {
                                                                                                    false = fun false true false ;
                                                                                                    true = fun false true true ;
                                                                                                } ;
                                                                                        } ;
                                                                                } ;
                                                                    teardown-asynch =
                                                                        ignore :
                                                                            {
                                                                                environment =
                                                                                    { resource , string , ... } :
                                                                                        [
                                                                                            ( string "AT" "${ at }" )
                                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                            ( string "NICE" "${ pkgs.coreutils }/bin/nice" )
                                                                                            ( resource "RESOURCE" )
                                                                                        ] ;
                                                                                script =
                                                                                    pkgs.stdenv.mkDerivation
                                                                                        {
                                                                                            installPhase =
                                                                                                ''
                                                                                                    ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/teardown-asynch.sh" } > $out &&
                                                                                                        ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                                                '' ;
                                                                                            name = "teardown-asynch" ;
                                                                                            src = ./. ;
                                                                                        } ;
                                                                            } ;
                                                                    teardown-synch =
                                                                        let
                                                                            fun =
                                                                                release : post : ignore :
                                                                                    {
                                                                                        environment =
                                                                                            { string , ... } :
                                                                                                [
                                                                                                    ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                                    ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                    ( string "FLOCK" "${ pkgs.coreutils }/bin/flock" )
                                                                                                    ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                                    ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                                                ] ;
                                                                                        script =
                                                                                            pkgs.stdenv.mkDerivation
                                                                                                {
                                                                                                    installPhase =
                                                                                                        let
                                                                                                            lines =
                                                                                                                splits
                                                                                                                    [
                                                                                                                        [ true 1 6 ]
                                                                                                                        [ release 8 15 ]
                                                                                                                        [ post 17 17 ]
                                                                                                                        [ release 21 24 ]
                                                                                                                        [ true 26 29 ]
                                                                                                                    ] ;
                                                                                                            in
                                                                                                                ''
                                                                                                                    ${ pkgs.gnused }/bin/sed -n ${ lines } > $out &&
                                                                                                                        ${ pkgs.coreutils }/bin/chmod 0555 $out
                                                                                                                '' ;
                                                                                                    name = "teardown-asynch" ;
                                                                                                    src = ./. ;
                                                                                                } ;
                                                                                    } ;
                                                                            in
                                                                                {
                                                                                    false =
                                                                                        {
                                                                                            false = fun false false ;
                                                                                            true = fun false true ;
                                                                                        } ;
                                                                                    true =
                                                                                        {
                                                                                            false = fun true false ;
                                                                                            true = fun true true ;
                                                                                        } ;
                                                                                } ;
                                                                        } ;
                                                } ;
                                        in
                                            {
                                                temporary = temporary ;
                                                util = util ;
                                            } ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
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