{
    inputs =
        {
            environment-variable.url = "github:/viktordanek/environment-variable" ;
            flake-utils.url = "github:numtide/flake-utils" ;
            nixpkgs.url = "github:NixOs/nixpkgs" ;
            shell-script.url = "github:viktordanek/shell-script/scratch/b6bb8f5b-7d48-4542-810c-58b5e36a3b0a" ;
            visitor.url = "github:viktordanek/visitor/scratch/1bd1c881-b72b-43d7-a819-f6072a9dfdf7" ;
        } ;
    outputs =
        { environment-variable , flake-utils , nixpkgs , self , shell-script , visitor } :
            let
                fun =
                    system :
                        let
                            _environment-variable = builtins.getAttr system environment-variable.lib ;
                            _shell-script = builtins.getAttr system shell-script.lib ;
                            _visitor = builtins.getAttr system visitor.lib ;                                                       
                            foobar =
                                let
                                    init =
                                        {
                                            extensions =
                                                {
                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                } ;
                                            name = "init" ;
                                            profile =
                                                { string } :
                                                    [
                                                        ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                        ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                        ( string "NAME" "init" )
                                                        ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                        ( string "TOUCH" "${ pkgs.coreutils }/bin/touch" )
                                                        ( string "UUID" "a0ec4aaa08d8dc652beb39be11f4b9619ec8b69d547c92e249c9fb06c295e13e2fcbf2ad25d60388e8c34241ade94494c598e3d413d7c90f95667b309ed62a8d" )
                                                    ] ;
                                            script = self + "/init.sh" ;
                                            tests =
                                                ignore :
                                                    {
                                                        mounts =
                                                            {
                                                                "/mount" =
                                                                    {
                                                                        expected = self + "/expected/init/mounts/target" ;
                                                                        initial =
                                                                            [
                                                                                "mkdir /mount/target"
                                                                            ] ;
                                                                    } ;
                                                            } ;
                                                    } ;
                                        } ;
                                    list =
                                        let
                                            foobar = name : temporary : { name = name ; value = temporary ; } ;
                                            tests =
                                                release : init :
                                                    let
                                                        failure =
                                                            if init then
                                                                {
                                                                    failure =
                                                                        ignore :
                                                                            {
                                                                                archive = self + "/expected/setup/failure/mounts/archive/${ builtins.toJSON release }/${ builtins.toJSON init }" ;
                                                                                arguments = "fd4107d952c0d02f4ea2e8963d673543791619d2ff0178d03222ea551c539c235a516d9f6dbb2c852618c634ead3ebc72d6beff6ee08880d422e10341390a94c" ;
                                                                                count = 501 ;
                                                                                status = 66 ;
                                                                            } ;
                                                                }
                                                            else { } ;
                                                        success =
                                                            {
                                                                success =
                                                                    ignore :
                                                                        {
                                                                            archive = self + "/expected/setup/success/mounts/archive/${ builtins.toJSON release }/${ builtins.toJSON init }" ;
                                                                            arguments = "5fcf30da8e09e5808370ee26227e38080bc3970d44cf95f50622b96b4b0daad9fdfc511b0bbfa974fc911d211b01b8e1051398b0bd9ca4d322b2f10e614b8474" ;
                                                                            count = 502 ;
                                                                            file = "db2717f674d6e7dde381029c828b969e6bc5e27ebf99d134264e3373fb892f42a988e34b0d9ff6b8609ed131b786ad1b9f6e82c9f45cc6ed50860e690e70bedf" ;
                                                                            paste = candidate : "if [ -d ${ candidate } ] ; then echo 275a6f1d6dfa76aa2bf189957d0dea80d6f61a7c42b373105f9307ca56917c4eca5dd54ebc13da72aded4fed2929c65f92e49bd474e616532cc29c64bb257a34 >> ${ candidate }/uuid ; else ${ _environment-variable "ECHO" } 21475b33095ae73d95cfba493a60ab1af51a1fb1921902ed4240b256cd704baa4515654cfb2fedc805a952df473aaabb5145c180c9adcfaa87fea24013e1aef4 > ${ candidate } ; fi" ;
                                                                            ## pipe = "8f3bf8bd37789fa3bba0f5d7dcabc848d42e9dfa1bca75c05e020ac8830912100623212067be8699aa489d5ee13367249a5f6ad3921296d4b9699375a9bc4ca6" ;
                                                                         } ;
                                                            } ;
                                                        in failure // success ;
                                            in
                                                [
                                                    ( foobar "0-0-0" ( lib { tests = tests false false ; } ) )
                                                    ( foobar "0-0-1" ( lib { post = post ; tests = tests false false ; } ) )
                                                    ( foobar "0-1-0" ( lib { release = release ; tests = tests true false ; } ) )
                                                    ( foobar "0-1-0" ( lib { release = release ; tests = tests true false ; } ) )
                                                    ( foobar "0-1-1" ( lib { release = release ; post = post ; tests = tests true false ; } ) )
                                                    ( foobar "1-0-0" ( lib { init = init ; tests = tests false true ; } ) )
                                                    ( foobar "1-0-1" ( lib { init = init ; post = post ; tests = tests false true ; } ) )
                                                    ( foobar "1-1-0" ( lib { init = init ; release = release ; tests = tests true true ; } ) )
                                                    ( foobar "1-1-1" ( lib { init = init ; release = release ; post = post ; tests = tests true true ; } ) )
                                                ] ;
                                    post =
                                        {
                                            extensions =
                                                {
                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                } ;
                                            name = "post" ;
                                            profile =
                                                { string } :
                                                    [
                                                        ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                        ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                        ( string "NAME" "post" )
                                                        ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                        ( string "TOUCH" "${ pkgs.coreutils }/bin/touch" )
                                                    ] ;
                                            script = self + "/flag.sh" ;
                                            tests =
                                                ignore :
                                                    {
                                                        mounts =
                                                            {
                                                                "/resource" =
                                                                    {
                                                                        expected = self + "/expected/post/mounts/resource" ;
                                                                        initial =
                                                                            [
                                                                                "echo c019fafab6f1d19b6266c357f4fa9ba6e6c88ef21e6f02a7777c2a94afec6608660f8252393648307b81da9d1a74552fbcaff38444bf42925a3001504fa5a65d > /mount/target"
                                                                            ] ;
                                                                    } ;
                                                            } ;
                                                        standard-output = self + "/expected/post/standard-output" ;
                                                    } ;
                                        } ;
                                    release =
                                        {
                                            extensions =
                                                {
                                                    string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                } ;
                                            name = "release" ;
                                            mounts =
                                                {
                                                    "/resource" =
                                                        {
                                                            host-path = _environment-variable "RESOURCE" ;
                                                            is-read-only = true ;
                                                        } ;
                                                } ;
                                            profile =
                                                { string } :
                                                    [
                                                        ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                        ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                        ( string "NAME" "release" )
                                                        ( string "SORT" "${ pkgs.coreutils }/bin/sort" )
                                                        ( string "TOUCH" "${ pkgs.coreutils }/bin/touch" )
                                                    ] ;
                                            script = self + "/flag.sh" ;
                                            tests =
                                                ignore :
                                                    {
                                                        mounts =
                                                            {
                                                                "/resource" =
                                                                    {
                                                                        expected = self + "/expected/release/mounts/resource" ;
                                                                        initial =
                                                                            [
                                                                                "echo 230ad29bc6c9ba25fb5afe5d79640fd2eeddd526483d1f5e844490e697d6917b4804a4f6d0eea656405a23f437071ad95c1cd71f2f62fe7a844f8cd216543750 > /mount/target"
                                                                            ] ;
                                                                    } ;
                                                            } ;
                                                        standard-output = self + "/expected/release/standard-output" ;
                                                    } ;
                                        } ;
                                    in builtins.listToAttrs ( list ) ;
                            lib =
                                {
                                    archive ? "ARCHIVE" ,
                                    init ? null ,
                                    initialization-error-code ? 66 ,
                                    lock-failure ? 64 ,
                                    over-initialized-target-error-code ? 68 ,
                                    post ? null ,
                                    release ? null ,
                                    resources ? "RESOURCES" ,
                                    self-teardown ? true ,
                                    shell-scripts ? { } ,
                                    stderr-emitted-error-code ? 67 ,
                                    tests ? null ,
                                    uninitialized-target-error-code ? 65 ,
                                } :
                                    let
                                        primary =
                                            let
                                                embolden =
                                                    let
                                                        embolden =
                                                            name : set :
                                                                if builtins.typeOf set == "null" then set
                                                                else if builtins.typeOf set == "set" then
                                                                    let
                                                                        arguments-minus = builtins.removeAttrs set [ "mounts" ] ;
                                                                        arguments-plus = arguments-minus // { mounts = mounts ; } ;
                                                                        eval = builtins.tryEval ( _shell-script arguments-plus ) ;
                                                                        mounts =
                                                                            {
                                                                                "${ resource }" =
                                                                                    {
                                                                                        host-path = _environment-variable "RESOURCE" ;
                                                                                        is-read-only = true ;
                                                                                    } ;
                                                                            } ;
                                                                        resource =
                                                                            if builtins.hasAttr "resource" set then builtins.getAttr "resource" set
                                                                            else "/resource" ;
                                                                        in if eval.success then eval.value else builtins.throw "There was a problem evaluating ${ name }."
                                                                else builtins.throw "${ name } is not null, set but ${ builtins.typeOf set }." ;
                                                        in
                                                            {
                                                                mock =
                                                                    {
                                                                        init =
                                                                            set :
                                                                                if builtins.typeOf set == "null" then set
                                                                                else if builtins.typeOf set == "set" then
                                                                                    let
                                                                                        archive =
                                                                                            if builtins.hasAttr "archive" set then builtins.getAttr "archive" set
                                                                                            else "/archive" ;
                                                                                        arguments-minus = builtins.removeAttrs set [ "mount" ] ;
                                                                                        arguments-plus = arguments-minus // { mounts = mounts ; } ;
                                                                                        eval = builtins.tryEval ( _shell-script arguments-plus ) ;
                                                                                        mount =
                                                                                            if builtins.hasAttr "resource" set then builtins.getAttr "mount" set
                                                                                            else "/mount" ;
                                                                                        mounts =
                                                                                            {
                                                                                                "${ archive }" =
                                                                                                    {
                                                                                                        host-path = _environment-variable "ARCHIVE" ;
                                                                                                        is-read-only = true ;
                                                                                                    } ;
                                                                                                "${ mount }" =
                                                                                                    {
                                                                                                        host-path = _environment-variable "TARGET_MOUNT" ;
                                                                                                        is-read-only = false ;
                                                                                                    } ;
                                                                                            } ;
                                                                                        in if eval.success then eval.value else builtins.throw "There was a problem evaluating init."
                                                                                else builtins.throw "init is not null, set but ${ builtins.typeOf set }." ;
                                                                    } ;
                                                                production =
                                                                    {
                                                                        init =
                                                                            set :
                                                                                if builtins.typeOf set == "null" then set
                                                                                else if builtins.typeOf set == "set" then
                                                                                    let
                                                                                        arguments-minus = builtins.removeAttrs set [ "mount" ] ;
                                                                                        arguments-plus = arguments-minus // { mounts = mounts ; } ;
                                                                                        eval = builtins.tryEval ( _shell-script arguments-plus ) ;
                                                                                        mount =
                                                                                            if builtins.hasAttr "resource" set then builtins.getAttr "mount" set
                                                                                            else "/mount" ;
                                                                                        mounts =
                                                                                            {
                                                                                                "${ mount }" =
                                                                                                    {
                                                                                                        host-path = _environment-variable "TARGET_MOUNT" ;
                                                                                                        is-read-only = false ;
                                                                                                    } ;
                                                                                            } ;
                                                                                        in if eval.success then eval.value else builtins.throw "There was a problem evaluating init."
                                                                                else builtins.throw "init is not null, set but ${ builtins.typeOf set }." ;
                                                                        post = embolden "post" ;
                                                                        release = embolden "release" ;
                                                                    } ;
                                                            } ;
                                                in
                                                    {
                                                        archive =
                                                            if builtins.typeOf archive == "string" then archive
                                                            else builtins.throw "archive is not string but ${ builtins.typeOf archive }." ;
                                                        init = embolden.production.init init ;
                                                        initialization-error-code =
                                                            if builtins.typeOf initialization-error-code == "int" then builtins.toString initialization-error-code
                                                            else builtins.throw "initialization-error-code is not int but ${ builtins.typeOf initialization-error-code }." ;
                                                        lock-failure =
                                                            if builtins.typeOf lock-failure == "int" then builtins.toString lock-failure
                                                            else builtins.throw "lock-failure is not int but ${ builtins.typeOf lock-failure }." ;
                                                        over-initialized-target-error-code =
                                                            if builtins.typeOf over-initialized-target-error-code == "int" then builtins.toString over-initialized-target-error-code
                                                            else builtins.throw "over-initialized-target-error-code is not int but ${ builtins.typeOf over-initialized-target-error-code }." ;
                                                        post = embolden.production.post post ;
                                                        release = embolden.production.release release ;
                                                        resources =
                                                            if builtins.typeOf resources == "string" then resources
                                                            else builtins.throw "resources is not string but ${ builtins.typeOf resources }." ;
                                                        self-teardown =
                                                            if builtins.typeOf self-teardown == "bool" then self-teardown
                                                            else builtins.throw "self-teardown is not bool but ${ builtins.typeOf self-teardown }." ;
                                                        stderr-emitted-error-code =
                                                            if builtins.typeOf stderr-emitted-error-code == "int" then builtins.toString stderr-emitted-error-code
                                                            else builtins.throw "stderr-emitted-error-code is not int but ${ builtins.typeOf stderr-emitted-error-code }." ;
                                                        tests =
                                                            _visitor
                                                                {
                                                                    lambda =
                                                                        path : value : ignore :
                                                                            let
                                                                                secondary =
                                                                                    let
                                                                                        identity =
                                                                                            {
                                                                                                archive ,
                                                                                                arguments ? null ,
                                                                                                count ? 2 ,
                                                                                                file ? null ,
                                                                                                paste ? null ,
                                                                                                pipe ? null ,
                                                                                                status ? 0
                                                                                            } :
                                                                                                {
                                                                                                    archive =
                                                                                                        if builtins.typeOf archive == "string" then
                                                                                                            if builtins.pathExists archive then archive
                                                                                                            else builtins.throw "the path for ${ archive } does not exist"
                                                                                                        else builtins.throw "archive is not string but ${ builtins.typeOf archive }." ;
                                                                                                    arguments =
                                                                                                        if builtins.typeOf arguments == "list" then builtins.map ( value : if builtins.typeOf value == "string" then value else builtins.throw "argument is not string but ${ builtins.typeOf value }." ) arguments
                                                                                                        else if builtins.typeOf arguments == "null" then [ ]
                                                                                                        else if builtins.typeOf arguments == "string" then [ arguments ]
                                                                                                        else builtins.throw "arguments is not list, null, string but ${ builtins.typeOf arguments }." ;
                                                                                                    count =
                                                                                                        if builtins.typeOf count == "int" then count
                                                                                                        else builtins.throw "count is not int but ${ builtins.typeOf count }." ;
                                                                                                    file =
                                                                                                        if builtins.typeOf file == "null" then [ ]
                                                                                                        else if builtins.typeOf file == "string" then [ "< ${ builtins.toFile "file" file }" ]
                                                                                                        else builtins.throw "file is not null, string but ${ builtins.typeOf file }." ;
                                                                                                    paste =
                                                                                                        if builtins.typeOf paste == "lambda" then
                                                                                                            if secondary.status == 0 then
                                                                                                                let
                                                                                                                    generator =
                                                                                                                        index :
                                                                                                                            let
                                                                                                                                value = paste ( _environment-variable "CANDIDATE_${ builtins.toString index }" ) ;
                                                                                                                                in if builtins.typeOf value == "string" then value else builtins.throw "paste is not string but ${ builtins.typeOf paste }." ;
                                                                                                                    in builtins.genList generator secondary.count
                                                                                                                else builtins.throw "it does not make sense to define paste when status is not zero."
                                                                                                        else if builtins.typeOf paste == "null" then paste
                                                                                                        else builtins.throw "paste is not lambda, null but ${ builtins.typeOf paste }." ;
                                                                                                    pipe =
                                                                                                        if builtins.typeOf pipe == "null" then [ ]
                                                                                                        else if builtins.typeOf pipe == "string" then
                                                                                                            if builtins.typeOf secondary.file == "null" then [ "cat ${ builtins.toFile "pipe" pipe } |" ]
                                                                                                            else builtins.throw "if we define both a pipe and a file then the file overrides the pipe"
                                                                                                        else builtins.throw "pipe is not null, string but ${ builtins.typeOf pipe }." ;
                                                                                                    status =
                                                                                                        if builtins.typeOf status == "int" then status
                                                                                                        else builtins.throw "status is not int but ${ builtins.typeOf status }." ;
                                                                                                } ;
                                                                                        in identity ( value null ) ;
                                                                                in
                                                                                    {
                                                                                        delay = true ;
                                                                                        mounts =
                                                                                            {
                                                                                                "/archive" =
                                                                                                    {
                                                                                                        expected =
                                                                                                            builtins.toString
                                                                                                                (
                                                                                                                    pkgs.stdenv.mkDerivation
                                                                                                                        {
                                                                                                                            installPhase =
                                                                                                                                ''
                                                                                                                                    ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                                                                        ${ pkgs.coreutils }/bin/seq 0 0 | while read INDEX
                                                                                                                                        do
                                                                                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ secondary.archive } $out/${ _environment-variable "INDEX" }
                                                                                                                                        done
                                                                                                                                '' ;
                                                                                                                            name = "expected" ;
                                                                                                                            src = ./. ;
                                                                                                                        }
                                                                                                                ) ;
                                                                                                        initial = [ "mkdir /mount/target" ] ;
                                                                                                    } ;
                                                                                                "/resources" =
                                                                                                    {
                                                                                                        expected = self + "/resources" ;
                                                                                                        initial = [ "mkdir /mount/target" ] ;
                                                                                                    } ;
                                                                                            } ;
                                                                                        standard-output = builtins.toFile "standard-output" ( if secondary.status == 0 then builtins.toString secondary.count else "" ) ;
                                                                                        status = secondary.status ;
                                                                                        test =
                                                                                            let
                                                                                                inner =
                                                                                                    pkgs.writeShellScript
                                                                                                        "inner"
                                                                                                        (
                                                                                                            let
                                                                                                                generator =
                                                                                                                    index :
                                                                                                                        builtins.concatLists
                                                                                                                            [
                                                                                                                                [
                                                                                                                                    "CANDIDATE_${ builtins.toString index }=$( ${ builtins.concatStringsSep " " ( builtins.concatLists [ secondary.pipe [ "candidate" ] secondary.arguments secondary.file ] ) } )"
                                                                                                                                ]
                                                                                                                                (
                                                                                                                                    if builtins.typeOf secondary.paste == "list" then
                                                                                                                                        [
                                                                                                                                            ( builtins.elemAt secondary.paste index )
                                                                                                                                        ]
                                                                                                                                    else [ ]
                                                                                                                                )
                                                                                                                            ] ;
                                                                                                                unique-vars =
                                                                                                                    if builtins.typeOf secondary.paste == "list" then
                                                                                                                        [
                                                                                                                            ''${ _environment-variable "ECHO" } -n $( ${ _environment-variable "ECHO" } -e "${ builtins.concatStringsSep "\n" ( builtins.genList ( index : _environment-variable "CANDIDATE_${ builtins.toString index }" ) secondary.count ) }" | ${ _environment-variable "SORT" } | ${ _environment-variable "UNIQ" } | ${ _environment-variable "WC" } --lines )''
                                                                                                                        ]
                                                                                                                    else [ ] ;
                                                                                                                in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ ( builtins.concatLists ( builtins.genList generator secondary.count ) ) unique-vars ] )
                                                                                                        ) ;
                                                                                                outer =
                                                                                                    pkgs.writeShellScript
                                                                                                        "outer"
                                                                                                        ''
                                                                                                            ${ inner } &&
                                                                                                                ${ pkgs.coreutils }/bin/sleep 0.1s
                                                                                                        '' ;
                                                                                                in builtins.toString outer ;
                                                                                    } ;
                                                                    null = path : value : null ;
                                                                }
                                                                tests ;
                                                        uninitialized-target-error-code =
                                                            if builtins.typeOf uninitialized-target-error-code == "int" then builtins.toString uninitialized-target-error-code
                                                            else builtins.throw "uninitialized-target-error-code is not int but ${ builtins.typeOf uninitialized-target-error-code }." ;
                                                    } ;
                                        setup-fun =
                                            is-mock : self-teardown : teardown :
                                                _shell-script
                                                    {
                                                        extensions =
                                                            {
                                                                has-standard-input = name : "export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/false ; fi )" ;
                                                                originator-pid =
                                                                    name :
                                                                        let
                                                                            grandparent-pid = "${ pkgs.procps }/bin/ps -p $( ${ parent-pid } ) -o ppid= | ${ pkgs.findutils }/bin/xargs" ;
                                                                            greatgrandparent-pid = "${ pkgs.procps }/bin/ps -p $( ${ grandparent-pid } ) -o ppid= | ${ pkgs.findutils }/bin/xargs" ;
                                                                            parent-pid = "${ pkgs.procps }/bin/ps -p ${ _environment-variable "$" } -o ppid= | ${ pkgs.findutils }/bin/xargs" ;
                                                                            in
                                                                                "export ${ name }=$( if [ -t 0 ] ; then ${ grandparent-pid } ; elif [ -p /proc/self/fd/0 ] ; then ${ greatgrandparent-pid } ; elif [ -f /proc/self/fd/0 ] ; then ${ greatgrandparent-pid } ; else ${ grandparent-pid } ; fi ; )" ;
                                                                standard-input = name : "export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )" ;
                                                                string = name : value : "export ${ name }=\"${ builtins.toString value }\"" ;
                                                            } ;
                                                        mounts =
                                                            {
                                                                "/archive" =
                                                                    {
                                                                        host-path = _environment-variable primary.archive ;
                                                                        is-read-only = false ;
                                                                    } ;
                                                                "/resources" =
                                                                    {
                                                                        host-path = _environment-variable primary.resources ;
                                                                        is-read-only = false ;
                                                                    } ;
                                                            } ;
                                                        name = "setup" ;
                                                        profile =
                                                            { has-standard-input , originator-pid , standard-input , string } :
                                                                builtins.concatLists
                                                                    [
                                                                        [
                                                                            ( string "BASENAME" "${ pkgs.coreutils }/bin/basename" )
                                                                            ( string "CAT" "${ pkgs.coreutils }/bin/cat" )
                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                            ( string "DIRNAME" "${ pkgs.coreutils }/bin/dirname" )
                                                                            ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                            ( has-standard-input "HAS_STANDARD_INPUT" )
                                                                        ]
                                                                        ( if builtins.typeOf init == "null" then [ ] else [ ( string "INIT" primary.init.shell-script ) ] )
                                                                        [
                                                                            ( string "INITIALIZATION_ERROR_CODE" primary.initialization-error-code )
                                                                            ( string "MAKE_WRAPPER" "${ pkgs.makeWrapper }" )
                                                                            ( string "MAKE_WRAPPER_TEARDOWN" "${ teardown.shell-script }" )
                                                                            ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" )
                                                                            ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                            ( originator-pid "ORIGINATOR_PID" )
                                                                            ( string "OVER_INITIALIZED_TARGET_ERROR_CODE" primary.over-initialized-target-error-code )
                                                                            ( string "READLINK" "${ pkgs.coreutils }/bin/readlink" )
                                                                            ( string "RESOURCES" ( _environment-variable primary.resources ) )
                                                                            ( standard-input "STANDARD_INPUT" )
                                                                            ( string "STDERR_EMITTED_ERROR_CODE" primary.stderr-emitted-error-code )
                                                                            ( string "UNINITIALIZED_TARGET_ERROR_CODE" primary.uninitialized-target-error-code )
                                                                            ( string "WC" "${ pkgs.coreutils }/bin/wc" )
                                                                            ( string "MOUNT" "${ pkgs.mount }/bin/mount" ) # KLUDGE
                                                                            ( string "GREP" "${ pkgs.gnugrep }/bin/grep" ) # KLUDGE
                                                                        ]
                                                                    ] ;
                                                        script =
                                                            let
                                                                all = builtins.filter ( x : builtins.typeOf x == "string" ) ( builtins.split "\n" ( builtins.readFile ( builtins.toString ( self + "/setup.sh" ) ) ) ) ;
                                                                array =
                                                                    builtins.concatLists
                                                                        [
                                                                            [ 0 ]
                                                                            [ 1 ]
                                                                            [ 2 ]
                                                                            [ 3 ]
                                                                            [ 4 ]
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 6 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 7 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 8 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 9 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 10 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 11 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 12 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 13 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 14 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 15 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 16 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 17 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 18 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 19 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 20 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 21 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 22 ] )
                                                                            [ 24 ]
                                                                            ( if builtins.typeOf primary.init == "null" then [ 26 ] else [ 28 ] )
                                                                            ( if self-teardown then [ 31 ] else [ ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 34 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 35 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 36 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 37 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 38 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 39 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 40 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 41 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 42 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 43 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 44 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ ] else [ 45 ] )
                                                                            ( if builtins.typeOf primary.init == "null" then [ 47 ] else [ ] )
                                                                        ] ;
                                                                with-index = builtins.genList ( index : { index = index ; line = builtins.elemAt all index ; } ) ( builtins.length all ) ;
                                                                filtered = builtins.filter ( x : builtins.any ( i : x.index == i ) array ) with-index ;
                                                                simplified = builtins.map ( x : x.line ) filtered ;
                                                                in builtins.toFile "setup" ( builtins.concatStringsSep "\n" simplified ) ;
                                                        sleep = 10 ;
                                                        tests = primary.tests ;
                                                    } ;
                                        setup = setup-fun false primary.self-teardown teardown ;
                                        setup-mock = setup-fun true true teardown-mock ;
                                        teardown-fun =
                                            post :
                                                _shell-script
                                                    {
                                                        extensions =
                                                            {
                                                                string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                            } ;
                                                        mounts =
                                                            {
                                                                "/mount" =
                                                                    {
                                                                        host-path = _environment-variable "RESOURCES" ;
                                                                        is-read-only = false ;
                                                                    } ;
                                                            } ;
                                                        name = "teardown" ;
                                                        profile =
                                                            { string } :
                                                                builtins.concatLists
                                                                    [
                                                                        [
                                                                            ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                            ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                            ( string "LOCK_FAILURE" primary.lock-failure )
                                                                            ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                        ]
                                                                        ( if builtins.typeOf post == "null" then [ ] else [ ( string "POST" post.shell-script ) ] )
                                                                        ( if builtins.typeOf primary.release == "null" then [ ] else [ ( string "RELEASE" primary.release.shell-script ) ] )
                                                                        [
                                                                            ( string "RESOURCE" "$( ${ _environment-variable "MKTEMP" } )" )
                                                                            ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                            ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                            ( string "TARGET" "$( ${ _environment-variable "MKTEMP" } )" )
                                                                            ( string "TRUE" "${ pkgs.coreutils }/bin/true" )
                                                                        ]
                                                                    ] ;
                                                        script =
                                                            let
                                                                all = builtins.filter ( x : builtins.typeOf x == "string" ) ( builtins.split "\n" ( builtins.readFile ( builtins.toString ( self + "/teardown.sh" ) ) ) ) ;
                                                                array =
                                                                    builtins.concatLists
                                                                        [
                                                                            [ 0 ]
                                                                            [ 1 ]
                                                                            [ 2 ]
                                                                            [ 3 ]
                                                                            [ 4 ]
                                                                            [ 5 ]
                                                                            [ 6 ]
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 8 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 9 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 10 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 11 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 12 ] )
                                                                            ( if builtins.typeOf primary.release == "null" then [ ] else [ 13 ] )
                                                                            ( if builtins.typeOf post == "null" then [ ] else [ 16 ] )
                                                                            [ 18 ]
                                                                            [ 19 ]
                                                                            [ 20 ]
                                                                            [ 21 ]
                                                                            [ 22 ]
                                                                        ] ;
                                                                with-index = builtins.genList ( index : { index = index ; line = builtins.elemAt all index ; } ) ( builtins.length all ) ;
                                                                filtered = builtins.filter ( x : builtins.any ( i : x.index == i ) array ) with-index ;
                                                                simplified = builtins.map ( x : x.line ) filtered ;
                                                                in builtins.toFile "teardown" ( builtins.concatStringsSep "\n" simplified ) ;
                                                        tests =
                                                            ignore :
                                                                {
                                                                    mounts =
                                                                        {
                                                                            "/mount" =
                                                                                {
                                                                                    expected = self + "/expected/teardown/mounts/resource" ;
                                                                                    initial =
                                                                                        [
                                                                                            "mkdir --parents /mount/target/resource"
                                                                                            "echo a60aa448919abcb69f7804ee9f3879fc9bd06765172f6c86cc697cc217719ae46278551a687cd80cc5a7d2c22ba2d79fccee95905ebb2865da1609da90d491c1 > /mount/target/resource/target"
                                                                                        ] ;
                                                                                } ;
                                                                        } ;
                                                                    profile =
                                                                        { string } :
                                                                            builtins.concatLists
                                                                                [
                                                                                    [
                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                        ( string "FLOCK" "${ pkgs.flock }/bin/flock" )
                                                                                        ( string "LOCK_FAILURE" primary.lock-failure )
                                                                                        ( string "MKTEMP" "${ pkgs.coreutils }/bin/mktemp" )
                                                                                        ( string "ORIGINATOR_PID" 9999 )
                                                                                    ]
                                                                                    ( if builtins.typeOf primary.post == "null" then [ ] else [ ( string "POST" primary.post.shell-script ) ] )
                                                                                    ( if builtins.typeOf primary.release == "null" then [ ] else [ ( string "RELEASE" primary.release.shell-script ) ] )
                                                                                    [
                                                                                        ( string "RESOURCE_NAME" "resource" )
                                                                                        ( string "RESOURCE" "$( ${ _environment-variable "MKTEMP" } )" )
                                                                                        ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                                        ( string "STATUS" 0 )
                                                                                        ( string "TAIL" "${ pkgs.coreutils }/bin/tail" )
                                                                                        ( string "TARGET" "$( ${ _environment-variable "MKTEMP" } )" )
                                                                                        ( string "TRUE" "${ pkgs.coreutils }/bin/true" )
                                                                                    ]
                                                                                ] ;
                                                                    standard-output = self + "/expected/teardown/standard-output-${ if builtins.typeOf primary.release == "null" then "0" else "1" }-${ if builtins.typeOf primary.post == "null" then "0" else "1" }" ;
                                                                } ;
                                                } ;
                                        teardown = teardown-fun primary.post ;
                                        teardown-mock = teardown-fun vacuum ;
                                        vacuum =
                                            _shell-script
                                                {
                                                    extensions =
                                                        {
                                                            string = name : value : "export ${ name }=${ builtins.toString value }" ;
                                                        } ;
                                                    mounts =
                                                        {
                                                            "/archive" =
                                                                {
                                                                    host-path = "/archive" ;
                                                                    is-read-only = false ;
                                                                } ;
                                                            "/resource" =
                                                                {
                                                                    host-path = "${ _environment-variable "RESOURCE" }" ;
                                                                    is-read-only = true ;
                                                                } ;
                                                        } ;
                                                    name = "vacuum" ;
                                                    profile =
                                                        { string } :
                                                            [
                                                                ( string "CP" "${ pkgs.coreutils }/bin/cp" )
                                                                ( string "DIFF" "${ pkgs.coreutils }/bin/diff" )
                                                                ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                ( string "FIND" "${ pkgs.findutils }/bin/find" )
                                                                ( string "RM" "${ pkgs.coreutils }/bin/rm" )
                                                                ( string "SED" "${ pkgs.gnused }/bin/sed" )
                                                                ( string "WC" "${ pkgs.coreutils }/bin/wc" )
                                                            ] ;
                                                    script = self + "/vacuum.sh" ;
                                                    tests =
                                                        ignore :
                                                            {
                                                                mounts =
                                                                    {
                                                                        "/archive" =
                                                                            {
                                                                                expected = self + "/expected/vacuum/mounts/archive" ;
                                                                                initial = [ "mkdir /mount/target" ] ;
                                                                            } ;
                                                                        "/resource" =
                                                                            {
                                                                                expected = self + "/expected/vacuum/mounts/resource" ;
                                                                                initial = [ "echo 58d9819914147cb93fb80eb662cd0f15a960feafe47c43d7a8dbedb20022f38f8b42b56d4edb54f5298608a6dc04cd1fb689e9c1ccbc409b67ccc518f40a061c > /mount/target" ] ;
                                                                            } ;
                                                                    } ;
                                                                test = "candidate" ;
                                                            } ;
                                                } ;
                                        in
                                            {
                                                shell-script = setup.shell-script ;
                                                tests =
                                                    pkgs.stdenv.mkDerivation
                                                        {
                                                            installPhase =
                                                                let
                                                                    constructor =
                                                                        builtins.concatStringsSep " &&\n\t"
                                                                            (
                                                                                let
                                                                                    metrics =
                                                                                        let
                                                                                            all =
                                                                                                builtins.concatLists
                                                                                                    [
                                                                                                        ( if builtins.typeOf primary.init == "null" then [ ] else [ { path = "init" ; value = primary.init.tests ; } ] )

                                                                                                        ( if builtins.typeOf primary.release == "null" then [ ] else [ { path = "release" ; value = primary.release.tests ; } ] )
                                                                                                        ( if builtins.typeOf primary.post == "null" then [ ] else [ { path = "post" ; value = primary.post.tests ; } ] )
                                                                                                        [ { path = "teardown" ; value = teardown.tests ; } ]
                                                                                                        [ { path = "vacuum" ; value = vacuum.tests ; } ]
                                                                                                        [ { path = "setup" ; value = setup-mock.tests ; } ]
                                                                                                    ] ;
                                                                                            in
                                                                                                {
                                                                                                    all = all ;
                                                                                                    delayed = builtins.filter ( value : builtins.pathExists "${ value.value }/DELAYED" && ! ( builtins.pathExists "${ value.value }/ERROR" || builtins.pathExists "${ value.value }/FAILURE" || builtins.pathExists "${ value.value }/SUCCESS" ) ) all ;
                                                                                                    error = builtins.filter ( value : builtins.pathExists "${ value.value }/ERROR" && ! ( builtins.pathExists "${ value.value }/DELAYED" || builtins.pathExists "${ value.value }/FAILURE" || builtins.pathExists "${ value.value }/SUCCESS" ) ) all ;
                                                                                                    failure = builtins.filter ( value : builtins.pathExists "${ value.value }/FAILURE" && ! ( builtins.pathExists "${ value.value }/DELAYED" || builtins.pathExists "${ value.value }/ERROR" || builtins.pathExists "${ value.value }/SUCCESS" ) ) all ;
                                                                                                    success = builtins.filter ( value : builtins.pathExists "${ value.value }/SUCCESS" && ! ( builtins.pathExists "${ value.value }/DELAYED" || builtins.pathExists "${ value.value }/ERROR" || builtins.pathExists "${ value.value }/FAILURE" ) ) all ;
                                                                                                } ;
                                                                                    in
                                                                                        [
                                                                                            (
                                                                                                let
                                                                                                    status =
                                                                                                        if builtins.length metrics.all == builtins.length metrics.success && builtins.length metrics.delayed == 0 && builtins.length metrics.error == 0 && builtins.length metrics.failure == 0 then "SUCCESS"
                                                                                                        else if builtins.length metrics.all == builtins.length metrics.success + builtins.length metrics.delayed && builtins.length metrics.error == 0 && builtins.length metrics.failure == 0 then "DELAYED"
                                                                                                        else if builtins.length metrics.all == builtins.length metrics.success + builtins.length metrics.delayed + builtins.length metrics.failure && builtins.length metrics.error == 0 then "FAILURE"
                                                                                                        else "ERROR" ;
                                                                                                    in "${ _environment-variable "TOUCH" } ${ _environment-variable "OUT" }/${ status }"
                                                                                            )
                                                                                            "source ${ _environment-variable "MAKE_WRAPPER" }/nix-support/setup-hook"
                                                                                            (
                                                                                                let
                                                                                                    observe =
                                                                                                        let
                                                                                                            delayed =
                                                                                                                let
                                                                                                                    mapper =
                                                                                                                        value :
                                                                                                                            [
                                                                                                                                ''${ _environment-variable "ECHO" } "- path: ${ builtins.replaceStrings [ "\"" ] [ "\\\"" ] ( builtins.toJSON value.path ) }"''
                                                                                                                                ''${ _environment-variable "ECHO" } "  status: DELAYED"''
                                                                                                                                ''if ${ value.value }/observe.wrapped.sh | ${ _environment-variable "YQ" } --yaml-output "{observe:.}" ; then ${ _environment-variable "ECHO" } "  result: SUCCESS" ; else ${ _environment-variable "ECHO" } "  result: FAILURE" ; fi''
                                                                                                                            ] ;
                                                                                                                    in builtins.concatLists ( builtins.map mapper metrics.delayed ) ;
                                                                                                            error =
                                                                                                                let
                                                                                                                    mapper =
                                                                                                                        value :
                                                                                                                            [
                                                                                                                                "${ _environment-variable "ECHO" }"
                                                                                                                                "${ _environment-variable "ECHO" } NOT TESTING ${ value.path } because it was ERROR"
                                                                                                                                "${ _environment-variable "ECHO" } ${ value.value }"
                                                                                                                                "${ _environment-variable "ECHO" } ERROR"
                                                                                                                                "exit 64"
                                                                                                                            ] ;
                                                                                                                    in builtins.concatLists ( builtins.map mapper metrics.error ) ;
                                                                                                            failure =
                                                                                                                let
                                                                                                                    mapper =
                                                                                                                        value :
                                                                                                                            [
                                                                                                                                "${ _environment-variable "ECHO" }"
                                                                                                                                "${ _environment-variable "ECHO" } NOT TESTING ${ value.path } because it was FAILURE"
                                                                                                                                "${ _environment-variable "ECHO" } ${ value.value }"
                                                                                                                                "${ _environment-variable "ECHO" } FAILURE"
                                                                                                                                "exit 64"
                                                                                                                            ] ;
                                                                                                                    in builtins.concatLists ( builtins.map mapper metrics.failure ) ;
                                                                                                            success =
                                                                                                                let
                                                                                                                    mapper =
                                                                                                                        value :
                                                                                                                            [
                                                                                                                                "${ _environment-variable "ECHO" }"
                                                                                                                                "${ _environment-variable "ECHO" } SKIPPING ${ value.path } in ${ _environment-variable "OUT" } because it was SUCCESS"
                                                                                                                                "${ _environment-variable "ECHO" } SUCCESS"
                                                                                                                            ] ;
                                                                                                                    in builtins.concatLists ( builtins.map mapper metrics.success ) ;
                                                                                                            in builtins.concatStringsSep " &&\n\t" ( builtins.concatLists [ delayed ] ) ;
                                                                                                    in "makeWrapper ${ pkgs.writeShellScript "observe.sh" observe } ${ _environment-variable "OUT" }/observe.wrapped.sh --set ECHO ${ _environment-variable "ECHO" } --set YQ ${ _environment-variable "YQ" }"
                                                                                            )
                                                                                        ]
                                                                            ) ;
                                                                    in
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                makeWrapper ${ pkgs.writeShellScript "constructor.sh" constructor } $out/constructor.wrapped.sh --set ECHO ${ pkgs.coreutils }/bin/echo --set MAKE_WRAPPER ${ pkgs.makeWrapper } --set OUT $out --set TOUCH ${ pkgs.coreutils }/bin/touch --set YQ ${ pkgs.yq }/bin/yq &&
                                                                                $out/constructor.wrapped.sh
                                                                        '' ;
                                                            name = "tests" ;
                                                            nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                            src = ./. ;
                                                        } ;
                                            } ;
                            pkgs = builtins.import nixpkgs { system = system ; } ;
                            in
                                {
                                    apps =
                                        let
                                            mapper =
                                                name : value :
                                                    {
                                                        type = "app" ;
                                                        program = "${ value.tests }/observe.wrapped.sh" ;
                                                    } ;
                                            in builtins.mapAttrs mapper foobar ;
                                    checks =
                                        let
                                            mapper =
                                                name : value :
                                                    pkgs.stdenv.mkDerivation
                                                        {
                                                            installPhase =
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/touch $out &&
                                                                        ${ pkgs.coreutils }/bin/echo The shell-script is ${ value.shell-script }. &&
                                                                        if [ -f ${ value.tests }/SUCCESS ]
                                                                        then
                                                                            ${ pkgs.coreutils }/bin/echo There was success in ${ value.tests }. >&2 &&
                                                                                exit 63
                                                                        elif [ -f ${ value.tests }/DELAYED ]
                                                                        then
                                                                            ${ pkgs.coreutils }/bin/echo There was delay in ${ value.tests }.
                                                                        elif [ -f ${ value.tests }/FAILURE ]
                                                                        then
                                                                            ${ pkgs.coreutils }/bin/echo There was failure in ${ value.tests }. >&2 &&
                                                                                exit 61
                                                                        else
                                                                            ${ pkgs.coreutils }/bin/echo There was error in ${ value.tests }. >&2 &&
                                                                                exit 60
                                                                        fi
                                                                '' ;
                                                            name = name ;
                                                            src = ./. ;
                                                        } ;
                                            in builtins.mapAttrs mapper foobar ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}