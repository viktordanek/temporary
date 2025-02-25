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
                                } :
                                    let
                                        derivation =
                                            pkgs.stdenv.mkDerivation
                                                {
                                                    installPhase =
                                                        let
                                                            constructors =
                                                                let
                                                                    mapper =
                                                                        path : name : value :
                                                                            if builtins.typeOf value == "lambda" then [ "${ pkgs.coreutils }/bin/ln --symbolic ${ value null }/setup ${ resolve "$out" path name }" ]
                                                                            else if builtins.typeOf value == "list" then
                                                                                let
                                                                                    generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                                    in builtins.concatLists ( builtins.genList generator ( builtins.length value ) )
                                                                            else if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) ) value )
                                                                            else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for construction is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                                    in builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ ] ) dependencies ) ) ;
                                                            in
                                                                ''
                                                                    ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                        ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/clean.sh" } > $out/clean.sh &&
                                                                        ${ pkgs.coreutils }/bin/chmod 0555 $out/clean &&
                                                                        makeWrapper $out/clean.sh $out/clean --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin --set RESOURCE_MASK ${ resource-mask } --set SED ${ pkgs.gnused }/bin/sed
                                                                        ${ builtins.concatStringsSep " &&\n\t" constructors }
                                                                '' ;
                                                    nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                    name = "temporary-implementation" ;
                                                    src = ./. ;
                                                } ;
                                        dependencies =
                                            let
                                                defaults =
                                                    value : ignore :
                                                        let
                                                            identity =
                                                                { init ? null , post ? null , release ? null , tests ? [ ] } :
                                                                    let
                                                                        executable =
                                                                            name : value :
                                                                                if builtins.typeOf value == "null" then { executable = null ; }
                                                                                else if builtins.typeOf value == "set" then value
                                                                                else builtins.throw "The ${ name } for dependencies is not null nor set but ${ builtins.typeOf value }." ;
                                                                        in
                                                                            {
                                                                                init = executable "init" init ;
                                                                                post = executable "post" post ;
                                                                                release = executable "release" release ;
                                                                                tests =
                                                                                    let
                                                                                        identity =
                                                                                            { paste ? null , pipe ? null , arguments ? null , file ? null , status ? true , expected , count ? 3 } :
                                                                                                {
                                                                                                    paste = paste ;
                                                                                                    pipe = pipe ;
                                                                                                    arguments = arguments ;
                                                                                                    file = file ;
                                                                                                    status = status ;
                                                                                                    expected = expected ;
                                                                                                } ;
                                                                                        in builtins.map identity tests ;
                                                                            } ;
                                                            execute-shell-script =
                                                                { executable ? null , executablePath ? null , environment ? { } : null } :
                                                                    {
                                                                        executable = executable ;
                                                                        environment = environment injection ;
                                                                    } ;
                                                            injection =
                                                                {
                                                                    is-file = is-file ;
                                                                    is-pipe = is-pipe ;
                                                                    string = name : value : "--set ${ name } ${ value }" ;
                                                                    resource = { name ? "RESOURCE" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )'" ;
                                                                    standard-input = { name ? "STANDARD_INPUT" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] || [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/cat ; else ${ pkgs.coreutils }/bin/echo ; fi )'" ;
                                                                    target = { name ? "TARGET" } : "--run 'export ${ name }=$( ${ pkgs.coreutils }/bin/dirname ${ builtins.concatStringsSep "" [ "$" "{" "0" "}" ] } )/target'" ;
                                                                } ;
                                                            write-shell-script =
                                                                { executable ? null , executablePath ? null , environment ? { } : null } :
                                                                    {
                                                                        executable = builtins.toFile "script" executable ;
                                                                        environment = environment injection ;
                                                                    } ;
                                                                in identity ( value { execute-shell-script = execute-shell-script ; write-shell-script = write-shell-script ; } ) ;
                                                filter =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then
                                                            let
                                                                d = defaults value null ;
                                                                predicate =
                                                                    test :
                                                                        let
                                                                            observation-derivation =
                                                                                test :
                                                                                    pkgs.mkDerivation
                                                                                        {
                                                                                            installPhase =
                                                                                                let
                                                                                                    command = temporary-derivation d.init d.release test.post ;
                                                                                                    arguments = if builtins.typeOf test.arguments == "null" then "" else "${ test.arguments }" ;
                                                                                                    file = if builtins.typeOf test.file == "null" then "" else " < ${ builtins.toFile "test" test.file }" ;
                                                                                                    paste = if builtins.typeOf test.paste == "null" then "" else "${ pkgs.coreutils }/bin/echo ${ test.paste } |" ;
                                                                                                    pipe = if builtins.typeOf test.pipe == "null" then "" else "${ pkgs.coreutils }/bin/echo ${ test.pipe } |" ;
                                                                                                    sub = "$( ${ pipe }${ command }${ arguments }${ file }" ;
                                                                                                    pass = "if ! ${ paste }${ sub } ; then ; fi" ;
                                                                                                    fail = "if ${ sub } ; then ; fi ;" ;
                                                                                                    reps = builtins.genList ( index : if test.status then pass else fail ) test.count ;
                                                                                                    in
                                                                                                        ''
                                                                                                            ${ builtins.concatStringsSep " &&\n\t" ( builtins.genList ( index : if test.status then pass else fail ) test.count ) } &&
                                                                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                                                ${ pkgs.coreutils }/bin/ln --symbolic ${ test.expected } $out/expected &&
                                                                                                                ${ pkgs.coreutils }/bin/cat /build/observed > $out/observed &&
                                                                                                                ${ pkgs.diffutils }/bin/diff --brief --recursive --side-by-side $out/expected $out/observed > $out/diff &&
                                                                                                                if [ -z "$( ${ pkgs.coreutils }/bin/cat $out/diff )" ]
                                                                                                                then
                                                                                                                    ${ pkgs.coreutils }/bin/echo true > $out/status
                                                                                                                else
                                                                                                                    ${ pkgs.coreutils }/bin/echo false > $out/status
                                                                                                                fi
                                                                                                        '' ;
                                                                                            name = "test-observation" ;
                                                                                            src = ./. ;
                                                                                        } ;
                                                                            in builtins.import "${ observation-derivation }/status" ;
                                                                in builtins.all predicate d.tests
                                                        else if builtins.typeOf value == "list" then true
                                                        else if builtins.typeOf value == "null" then true
                                                        else if builtins.typeOf value == "set" then true
                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for filtering initialization is not lambda, list, null, nor set but ${ builtins.typeOf value }." ;
                                                lambda =
                                                    path : name : value : ignore :
                                                        let
                                                            d = defaults value ignore ;
                                                            in temporary-derivation d.init d.release d.post ;
                                                mapper =
                                                    path : name : value :
                                                        if builtins.typeOf value == "lambda" then lambda path name value
                                                        else if builtins.typeOf value == "list" then
                                                            let
                                                                generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( pkgs.lib.filterAttrs ( filter ( builtins.concatLists [ path [ name ] ] ) index builtins.elemAt value index ) ) ;
                                                                in builtins.genList generator ( builtins.length value )
                                                        else if builtins.typeOf value == "null" then lambda path name ( x : { } )
                                                        else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) ( pkgs.lib.filterAttrs ( filter ( builtins.concatLists [ path [ name ] ] ) value ) )
                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for mapping initialization is not lambda, list, null, nor set but ${ builtins.typeOf value }." ;
                                                temporary-derivation =
                                                    init : release : post :
                                                        pkgs.stdenv.mkDerivation
                                                            {
                                                                installPhase =
                                                                    let
                                                                        executable =
                                                                            name : value : ( builtins.trace "${ name } is a ${ builtins.typeOf value.executable }" (
                                                                                let
                                                                                    in
                                                                                        if builtins.typeOf value.executable == "null" then "${ pkgs.coreutils }/bin/true ${ name }"
                                                                                        else if builtins.typeOf value.executable == "string" then
                                                                                            ''${ pkgs.coreutils }/bin/cat ${ value.executable } > $out/init.sh &&
                                                                                                    ${ pkgs.coreutils }/bin/chmod 0555 $out/${ name }.sh &&
                                                                                                    makeWrapper $out/${ name }.sh $out/${ name } ${ builtins.concatStringsSep " " value.environment }''
                                                                                        else builtins.throw "The ${ name }.executable for construction is not null nor string but ${ builtins.typeOf init }." ) );
                                                                        in
                                                                            ''
                                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                                    ${ executable "init" init } &&
                                                                                    ${ executable "release" release } &&
                                                                                    ${ executable "post" post } &&
                                                                                    ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/setup.sh" } > $out/setup.sh &&
                                                                                    ${ pkgs.coreutils }/bin/chmod 0550 $out/setup.sh &&
                                                                                    makeWrapper \
                                                                                        $out/setup.sh \
                                                                                        $out/setup \
                                                                                        --set CAT ${ pkgs.coreutils }/bin/cat \
                                                                                        --set CHMOD ${ pkgs.coreutils }/bin/chmod \
                                                                                        --set ECHO ${ pkgs.coreutils }/bin/echo \
                                                                                        ${ grandparent-pid { } } \
                                                                                        --set INIT $out/init \
                                                                                        --set INITIALIZER ${ builtins.toString initializer } \
                                                                                        ${ is-file { } } \
                                                                                        ${ is-interactive { } } \
                                                                                        ${ is-pipe { } } \
                                                                                        --set LN ${ pkgs.coreutils }/bin/ln \
                                                                                        --set MKTEMP ${ pkgs.coreutils }/bin/mktemp \
                                                                                        ${ parent-pid { } } \
                                                                                        --set POST $out/post \
                                                                                        --set RELEASE $out/release \
                                                                                        --set RESOURCE_MASK ${ resource-mask } \
                                                                                        --set RM ${ pkgs.coreutils }/bin/rm \
                                                                                        --set STANDARD_ERROR ${ builtins.toString standard-error } \
                                                                                        --set TEARDOWN_ASYNCH $out/teardown-asynch \
                                                                                        --set TEARDOWN_SYNCH $out/teardown-synch \
                                                                                        --set TEE ${ pkgs.coreutils }/bin/tee &&
                                                                                    ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/teardown-asynch.sh" } > $out/teardown-asynch.sh &&
                                                                                    ${ pkgs.coreutils }/bin/chmod 0550 $out/teardown-asynch.sh &&
                                                                                    makeWrapper \
                                                                                        $out/teardown-asynch.sh \
                                                                                        $out/teardown-asynch \
                                                                                        --set AT ${ at } \
                                                                                        --set ECHO ${ pkgs.coreutils }/bin/echo \
                                                                                        --set NICE ${ pkgs.coreutils }/bin/nice \
                                                                                        --set TEARDOWN_SYNCH $out/teardown-synch &&
                                                                                    ${ pkgs.coreutils }/bin/cat ${ self + "/scripts/implementation/teardown-synch.sh" } > $out/teardown-synch.sh &&
                                                                                    ${ pkgs.coreutils }/bin/chmod 0550 $out/teardown-synch.sh &&
                                                                                    makeWrapper \
                                                                                        $out/teardown-synch.sh \
                                                                                        $out/teardown-synch \
                                                                                        --set BASENAME ${ pkgs.coreutils }/bin/basename \
                                                                                        --set CHMOD ${ pkgs.coreutils }/bin/chmod \
                                                                                        --set ECHO ${ pkgs.coreutils }/bin/echo \
                                                                                        --set FIND ${ pkgs.findutils }/bin/find \
                                                                                        --set FLOCK ${ pkgs.flock }/bin/flock \
                                                                                        --set RM ${ pkgs.coreutils }/bin/rm \
                                                                                        --set TAIL ${ pkgs.coreutils }/bin/tail
                                                                            '' ;
                                                                name = "temporary-derivation" ;
                                                                nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                                src = ./. ;
                                                            } ;
                                                in builtins.mapAttrs ( mapper [ ] ) ( pkgs.lib.filterAttrs ( filter [ ] ) ( if builtins.typeOf temporary == "set" then temporary else builtins.throw "The temporary must be a set but it is a ${ builtins.typeOf temporary }." ) ) ;
                                        grandparent-pid = { name ? "GRANDPARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p $( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= ) -o ppid= )'" ;
                                        harvest =
                                            {
                                                derivation =
                                                    let
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then resolve derivation path name
                                                                else if builtins.typeOf value == "list" then
                                                                    let
                                                                        generator = index : mapper ( builtins.concatLists [ path [ name ] ] ) index ( builtins.elemAt value index ) ;
                                                                        in builtins.genList generator ( builtins.length value )
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( builtins.concatLists [ path [ name ] ] ) value
                                                                else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " ( builtins.concatLists [ path [ name ] ] ) } for harvest is not lambda, list, nor set but ${ builtins.typeOf value }." ;
                                                        in builtins.mapAttrs ( mapper [ ] ) dependencies ;
                                            } ;
                                        is-file = { name ? "IS_FILE" } : "--run 'export ${ name }=$( if [ -f /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-interactive = { name ? "IS_INTERACTIVE" } : "--run 'export ${ name }=$( if [ -t 0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        is-pipe = { name ? "IS_PIPE" } : "--run 'export ${ name }=$( if [ -p /proc/self/fd/0 ] ; then ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/true ; else ${ pkgs.coreutils }/bin/echo ${ pkgs.coreutils }/bin/false ; fi )'" ;
                                        parent-pid = { name ? "PARENT_PID" } : "--run 'export ${ name }=$( ${ pkgs.procps }/bin/ps -p ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] } -o ppid= )'" ;
                                        resolve = derivation : path : name : builtins.concatStringsSep "/" ( builtins.map builtins.toString [ derivation ( builtins.hashString "sha512" ( builtins.concatStringsSep "" ( builtins.map builtins.toJSON ( builtins.concatLists [ path [ name ] ] ) ) ) ) ] ) ;
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
                                                                                    a4374430e2a3ace64473d4c54891829ec96b4bfcd6ed6688d30cc4ff486b13dd9366bd4cb808d30c97471e99f200c605b28e7a4b7211834492d4f361c05b41c5 =
                                                                                        { execute-shell-script , ... } :
                                                                                            {
                                                                                                init =
                                                                                                    execute-shell-script
                                                                                                        {
                                                                                                            executablePath = self + "/scripts/test/temporary/executable.sh" ;
                                                                                                            environment =
                                                                                                                { is-file , is-pipe , resource , standard-input , string , target } :
                                                                                                                    [
                                                                                                                        ( string "ECHO" "${ pkgs.coreutils }/bin/echo" )
                                                                                                                        ( is-file { name = "cd4d67f6ced1af72b6e50619ab0912f3ae836ecb8186343d64bb339ced909edd4548479d0dad93cb5ecb7f0606c78a8402b90c49a2b1d4c0a5d8200230e01809" ; } )
                                                                                                                        ( is-pipe { name = "bed950554a6c594ded4790bca8c9f65f0df4baa61b3fa78f33bcf8b9e3621544929d25e985698dfecc0b5a5f192e32ccf2cadbee0d2bc661374a7ded99e45579" ; } )
                                                                                                                        ( string "JQ" "${ pkgs.yq }/bin/yq" )
                                                                                                                        ( resource { name = "c8abe0fd64014b729ad36cb4718564939f0981c7fa252deb5f0f90e460bc438033f7ff4e7204f2c4ca7243c77a356df83f89e31769ed35838c28a9e8b8135306" ; } )
                                                                                                                        ( standard-input { name = "d41b97db28e49daef96554b8535fe7418ec4ac916ad5689eefd26d2b72266125db6f765c93d30d98b21e24e8473c9bc24ad8e8f297fad993aae68c4792dfba64" ; } )
                                                                                                                        ( target { name = "d3acba00ade7e9841335effc04350b1e5744ba5a2abf7f1d096536af11f1bd6b4143426263f237cc0a4b45d6303c32e2259495e309f18653a33e8481fa568b2e" ; } )
                                                                                                                        ( string "TEMPLATE_FILE" ( self + "/scripts/test/temporary/executable.json" ) )
                                                                                                                        ( string "YQ" "${ pkgs.yq }/bin/yq" )
                                                                                                                    ] ;
                                                                                                        } ;
                                                                                            } ;
                                                                                    foobar = { write-shell-script , ... } : { } ;
                                                                                    mkdir =
                                                                                        { write-shell-script , ... } :
                                                                                            {
                                                                                                init =
                                                                                                    write-shell-script
                                                                                                        {
                                                                                                            executable = "${ builtins.concatStringsSep "" [ "$" "{" "MKDIR" "}" ] } ${ builtins.concatStringsSep "" [ "$" "{" "TARGET" "}" ] }" ;
                                                                                                            environment = { string , target , ... } : [ ( string "MKDIR" "${ pkgs.coreutils }/bin/mkdir" ) ( target { } ) ] ;
                                                                                                        } ;
                                                                                            } ;
                                                                                    touch =
                                                                                        { write-shell-script , ... } :
                                                                                            {
                                                                                                init =
                                                                                                    write-shell-script
                                                                                                        {
                                                                                                            executable = "${ builtins.concatStringsSep "" [ "$" "{" "TOUCH" "}" ] } ${ builtins.concatStringsSep "" [ "$" "{" "TARGET" "}" ] }" ;
                                                                                                            environment = { string , target , ... } : [ ( string "TOUCH" "${ pkgs.coreutils }/bin/mkdir" ) ( target { } ) ] ;
                                                                                                        } ;
                                                                                            } ;
                                                                                } ;
                                                                        } ;
                                                            } ;
                                                        in
                                                            ''
                                                                ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                    ${ pkgs.coreutils }/bin/echo ${ resources.foobar.derivation.a4374430e2a3ace64473d4c54891829ec96b4bfcd6ed6688d30cc4ff486b13dd9366bd4cb808d30c97471e99f200c605b28e7a4b7211834492d4f361c05b41c5 } &&
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