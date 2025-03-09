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
                                                        ] ;
                                                    mounts = mounts ;
                                                    shell-scripts =
                                                        {
                                                            setup =
                                                                let
                                                                    fun =
                                                                        init : release : post : ignore :
                                                                            {
                                                                                environment =
                                                                                    { grandparent-pid , is-interactive , is-file , is-pipe , parent-pid , string , ... } :
                                                                                        [
                                                                                            ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                                            ( string "CHMOD" "${ pkgs.coreutils }/bin/chmod" )
                                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                            ( grandparent-pid )
                                                                                            ( is-file )
                                                                                            ( is-interactive )
                                                                                            ( is-pipe )
                                                                                            ( string "LN" "${ pkgs.coreutils }/bin/ln" )
                                                                                            ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                            ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                            (
                                                                                            )
                                                                                            (
                                                                                                string "TEARDOWN_SYNCH" "${ teardown-synch }"
                                                                                            )
                                                                                            ( string "TEE" "${ pkgs.coreutils }/bin/tee" )
                                                                                        ] ;
                                                                                script = self + "/scripts/setup.sh" ;
                                                                            } ;
                                                                    in
                                                                        {
                                                                            false =
                                                                                {
                                                                                    false =
                                                                                        {
                                                                                            false = fun false false false ;
                                                                                            false = fun false false true ;
                                                                                        } ;
                                                                                    true =
                                                                                        {
                                                                                            false = fun false true false ;
                                                                                            false = fun false true true ;
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
                                                                                                        if release then
                                                                                                            if post then ''-e "1,6p" -e "8,15,p" -e "17,17p" -e "19,19p" -e "21,27p"''
                                                                                                            else ''-e "1,6p" -e "8,15,p"  -e "19,19p" -e "21,27p"''
                                                                                                        else
                                                                                                            if post then ''-e "1,6p" -e "17,17p" -e "21,27p"''
                                                                                                            else ''-e "1,6p" -e "21,27p"'' ;
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
                                                                                    true = run true true ;
                                                                                } ;
                                                                        } ;
                                                        } ;
                                                } ;
                                        in
                                            {

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