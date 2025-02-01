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
                                    at ? "${ pkgs.at }/bin/at" ,
                                    resource ,
                                    store ? "bb8a0f30f43c48f4abcc70b9be4611e9dac31a5768c24383111b1240c35e22a4a3bac382ded1b154559b64424789499391d1b73cc3ad92157c4a5f341e9689e4" ,
                                    target ,
                                    temporary ? { } ,
                                    temporary-initialization-error ? 64 ,
                                    temporary-path ? "ae67680146758d609c87886765e9778fba6b9f0bf565ccf48468833c46115a1e9a3faa641f437f5aea0c150c9030892c82d4648fdb6f4e744673c8ccf63e7e16" ,
                                    temporary-resource-mask ? "temporary.XXXXXXXX"
                                } :
                                    let
                                        dependencies =
                                            {
                                                temporary =
                                                    let
                                                        lambda =
                                                            path : name : value :
                                                                let
                                                                    identity =
                                                                        {
                                                                            init ? builtins.null ,
                                                                            release ? builtins.null ,
                                                                            post ? builtins.null
                                                                        } :
                                                                            {
                                                                                init =
                                                                                    if builtins.typeOf init == "lambda" then init
                                                                                    else if builtins.typeOf init == "null" then builtins.null
                                                                                    else builtins.throw "The init defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf init }." ;
                                                                                release =
                                                                                    if builtins.typeOf release == "lambda" then release
                                                                                    else if builtins.typeOf release == "null" then builtins.null
                                                                                    else builtins.throw "The release defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf release }." ;
                                                                                post =
                                                                                    if builtins.typeOf post == "lambda" then post
                                                                                    else if builtins.typeOf post == "null" then builtins.null
                                                                                    else builtins.throw "The post defined at ${ builtins.concatStringsSep " / " path }/${ name } is neither a lambda nor a null but a ${ builtins.typeOf post }." ;
                                                                            } ;
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
                                                                                                (
                                                                                                    if builtins.typeOf executable == "set" then
                                                                                                        [
                                                                                                            "makeWrapper"
                                                                                                            ( builtins.toString executable )
                                                                                                            "${ builtins.concatStringsSep "/" path }/${ name }/${ binary }"
                                                                                                        ]
                                                                                                    else builtins.throw "The executable is not a set but a ${ builtins.typeOf executable }"
                                                                                                )
                                                                                                (
                                                                                                    if
                                                                                                        builtins.typeOf sets == "lambda" &&
                                                                                                            builtins.typeOf ( sets ( harvest "$OUT" ) ) == "set" && builtins.all ( s : builtins.typeOf s == "string" ) ( builtins.attrValues ( sets ( harvest "$OUT" ) ) )
                                                                                                    then
                                                                                                        builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( name : value : [ "--set ${ name } ${ value }" ] ) ( sets ( harvest "$out" ) ) ) )
                                                                                                    else if
                                                                                                        builtins.typeOf sets == "set" && builtins.all ( s : builtins.typeOf s == "string" ) ( builtins.attrValues sets )
                                                                                                        then
                                                                                                            builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( name : value : [ "--set ${ name } ${ value }" ] ) sets ) )
                                                                                                    else builtins.throw "The sets is neither a lambda that generates a set of strings nor a set of strings."
                                                                                                )
                                                                                            ]
                                                                                    ) ;
                                                                    in ignore : identity ( value script ) ;
                                                        mapper =
                                                            path : name : value :
                                                                if builtins.typeOf value == "lambda" then lambda path name value
                                                                else if builtins.typeOf value == "null" then lambda path name { }
                                                                else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                                else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda, null, nor a set but is a ${ builtins.typeOf value }." ;
                                                        in builtins.mapAttrs ( mapper [ "temporary" ] ) temporary ;
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
                                                                                    [
                                                                                        "if [ ! -d ${ builtins.concatStringsSep "/" path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path } ; fi"
                                                                                        "${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path }/${ name }"
                                                                                    ]
                                                                                    (
                                                                                        if computed.init == null then [ ]
                                                                                        else [ (  computed.init path name "init.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.release == null then [ ]
                                                                                        else [ ( computed.release path name "release.sh" ) ]
                                                                                    )
                                                                                    (
                                                                                        if computed.post == null then [ ]
                                                                                        else [ ( computed.post path name "post.sh" ) ]
                                                                                    )
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/setup.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/setup.sh ${ builtins.concatStringsSep "/" path }/${ name }/setup --set AT ${ at } --set CAT ${ pkgs.coreutils }/bin/cat --set CHMOD ${ pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${ pkgs.coreutils }/bin/echo --set ERROR ${ builtins.toString temporary-initialization-error } --set GREP ${ pkgs.gnugrep }/bin/grep --set INIT ${ builtins.concatStringsSep "/" path }/${ name }/init.sh --set LN ${ pkgs.coreutils }/bin/ln --set MKTEMP ${ pkgs.coreutils }/bin/mktemp --set MV ${ pkgs.coreutils }/bin/mv --set NICE ${ pkgs.coreutils }/bin/nice --set PS ${ pkgs.ps }/bin/ps --set READLINK ${ pkgs.coreutils }/bin/readlink --set RELEASE ${ builtins.concatStringsSep "/" path }/${ name }/release.sh --set POST ${ builtins.concatStringsSep "/" path }/${ name }/post.sh --set RESOURCE ${ resource } --set TAIL ${ pkgs.coreutils }/bin/tail --set TARGET ${ target } --set TEARDOWN_ASYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch --set TEMPORARY_PATH ${ temporary-path } --set TEMPORARY_PATH_ARRAY ${ builtins.concatStringsSep "/" ( builtins.concatLists [ ( builtins.map ( n : builtins.elemAt path n ) ( builtins.filter ( n : n > 1 ) ( builtins.genList ( n : n ) ( builtins.length path ) ) ) ) [ name ] ] ) } --set TEE ${ pkgs.coreutils }/bin/tee --set TEMPORARY_RESOURCE_MASK ${ temporary-resource-mask }"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-asynch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-asynch --set AT ${ at } --set ECHO ${ pkgs.coreutils }/bin/echo --set NICE ${ pkgs.coreutils }/bin/nice  --set TEARDOWN_SYNCH ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch"
                                                                                    ]
                                                                                    [
                                                                                        "${ pkgs.coreutils }/bin/cp ${ self + "/scripts/implementation/teardown-synch.sh" } ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "${ pkgs.coreutils }/bin/chmod 0550 ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh"
                                                                                        "makeWrapper ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch.sh ${ builtins.concatStringsSep "/" path }/${ name }/teardown-synch  --set BASENAME ${ pkgs.coreutils }/bin/basename --set CHMOD ${pkgs.coreutils }/bin/chmod --set DIRNAME ${ pkgs.coreutils }/bin/dirname --set ECHO ${pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set FLOCK ${ pkgs.flock }/bin/flock  --set MV ${pkgs.coreutils }/bin/mv --set RM ${pkgs.coreutils }/bin/rm --set TAIL ${ pkgs.coreutils }/bin/tail --set TRUE ${ pkgs.coreutils }/bin/true --set CAT ${ pkgs.coreutils }/bin/cat"
                                                                                    ]
                                                                                ]
                                                                    else if builtins.typeOf value == "set" then
                                                                        builtins.concatLists
                                                                            [
                                                                                [
                                                                                    "if [ ! -d ${ builtins.concatStringsSep "/" path } ] ; then ${ pkgs.coreutils }/bin/mkdir ${ builtins.concatStringsSep "/" path } ; fi"
                                                                                ]
                                                                                ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) ) )
                                                                            ]
                                                                    else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
                                                            in
                                                                builtins.concatStringsSep " && " ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper [ "$out" ] ) dependencies ) ) ) ;
                                                } ;
                                        harvest =
                                            derivation :
                                                let
                                                    mapper =
                                                        path : name : value :
                                                            if builtins.typeOf value == "lambda" then "${ builtins.concatStringsSep "/" path }/${ name }/setup"
                                                            else if builtins.typeOf value == "set" then builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value
                                                            else builtins.throw "The dependency defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a lambda nor a set but a ${ builtins.typeOf value }." ;
                                                    in builtins.mapAttrs ( mapper [ derivation ] ) { temporary = temporary ; } ;
                                        in harvest ( builtins.toString derivation ) ;
                            pkgs = import nixpkgs { system = system ; } ;
                            in
                                {
                                    checks.testLib =
                                        let
                                            resources =
                                                let
                                                    temporary =
                                                        let
                                                            rows =
                                                                let
                                                                    list =
                                                                        let
                                                                            fields =
                                                                                let
                                                                                    list =
                                                                                        let
                                                                                            generator =
                                                                                                index :
                                                                                                    let
                                                                                                        elem = builtins.elemAt list index ;
                                                                                                        in
                                                                                                            {
                                                                                                                name = elem.name ;
                                                                                                                size = elem.size ;
                                                                                                                lambda = elem.lambda ;
                                                                                                                index = index ;
                                                                                                            } ;
                                                                                            list =
                                                                                                let
                                                                                                    hash = index : string : val : builtins.substring 0 8 ( builtins.hashString "md5" ( builtins.concatStringsSep "" ( builtins.map builtins.toString [ index string val ] ) ) ) ;
                                                                                                    lambda = index : string : val : "lambda" ;
                                                                                                    status = index : string : val : builtins.toString ( if val == 0 then 0 else builtins.fromJSON ( builtins.replaceStrings [ "a" "b" "c" "d" "e" "f" ] [ "10" "11" "12" "13" "14" "15" ] ( builtins.substring 0 1 ( hash index string val ) ) ) + 1 ;
                                                                                                    zero = index : string : val : if val == 0 then "_" else hash index string val ;
                                                                                                    in
                                                                                                        [
                                                                                                            { name = "index" ; size = 1 ; lambda = index : string : val : index ; }
                                                                                                            { name = "name" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "arguments" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "standard-input" ; size = 2 ; lambda = zero ; }
                                                                                                            { name = "init-typeOf" ; size = 1 ; lambda = lambda ; }
                                                                                                            { name = "init-standard-output" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "init-standard-error" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "init-status" ; size = 2 ; lambda = status ; }
                                                                                                            { name = "init-token-arguments" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "init-token-standard-input" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "init-token-paste-1" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "init-token-paste-2" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "release-typeOf" ; size = 1 ; lambda = lambda ; }
                                                                                                            { name = "release-standard-output" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "release-standard-error" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "release-status" ; size = 2 ; lambda = status ; }
                                                                                                            { name = "release-token-arguments" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "release-token-standard-input" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "release-token-paste-1" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "release-token-paste-2" ; size = 1 ; lambda = hash ; }
                                                                                                            { name = "speed" ; size = 1 ; lambda = index : string : val : builtins.elemAt [ "slow" "fast" ] val ; }
                                                                                                        ] ;
                                                                                            in builtins.genList generator ( builtins.length list ) ;
                                                                                    mapper =
                                                                                        { name , size , lambda , index } :
                                                                                            {
                                                                                                name = name ;
                                                                                                size = size ;
                                                                                                lambda = lambda ;
                                                                                                index = index ;
                                                                                                cumulative-size =
                                                                                                    let
                                                                                                        sub = builtins.filter ( f : f.index <= index ) list ;
                                                                                                        in builtins.foldl' ( previous : current : previous * current.size ) 1 sub ;
                                                                                            } ;
                                                                                    in builtins.map mapper list ;
                                                                            generator =
                                                                                index :
                                                                                    let
                                                                                        mapper =
                                                                                            value :
                                                                                                let
                                                                                                    val =
                                                                                                        let
                                                                                                            div = a : b : a / b ;
                                                                                                            mod = a : b : a - ( b * ( a / b ) ) ;
                                                                                                            in mod ( div index value.cumulative-size ) value.size ;
                                                                                                    in
                                                                                                        {
                                                                                                            name = value.name ;
                                                                                                            value = value.lambda index value.name val ;
                                                                                                        } ;
                                                                                        in builtins.listToAttrs ( builtins.map mapper fields ) ;
                                                                            size = builtins.foldl' ( previous : current : previous * current.size ) 1 fields ;
                                                                            in builtins.genList generator size ;
                                                                    mapper =
                                                                        {
                                                                            index ,
                                                                            name ,
                                                                            arguments ,
                                                                            standard-input ,
                                                                            init-typeOf ,
                                                                            init-standard-output ,
                                                                            init-standard-error ,
                                                                            init-status ,
                                                                            init-token-arguments ,
                                                                            init-token-standard-input ,
                                                                            init-token-paste-1 ,
                                                                            init-token-paste-2 ,
                                                                            release-typeOf ,
                                                                            release-standard-output ,
                                                                            release-standard-error ,
                                                                            release-status ,
                                                                            release-token-arguments ,
                                                                            release-token-standard-input ,
                                                                            release-token-paste-1 ,
                                                                            release-token-paste-2 ,
                                                                            speed
                                                                        } :
                                                                            {
                                                                                "${ init-status }"."${ arguments }"."${ standard-input }"."${ name }" =
                                                                                    script :
                                                                                        {
                                                                                            init =
                                                                                                script
                                                                                                    {
                                                                                                        executable = pkgs.writeScript "init" ( builtins.readFile ( self + "/scripts/test/temporary/init.sh" ) ) ;
                                                                                                        sets =
                                                                                                            harvest :
                                                                                                                {
                                                                                                                    CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                    ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                    IDENTITY = harvest.temporary.util.identity ;
                                                                                                                    NAME = name ;
                                                                                                                    SPEED = speed ;
                                                                                                                    STANDARD_ERROR = init-standard-error ;
                                                                                                                    STANDARD_OUTPUT = init-standard-output ;
                                                                                                                    STATUS = init-status ;
                                                                                                                    TEE = "${ pkgs.coreutils }/bin/tee" ;
                                                                                                                    TOKEN_ARGUMENTS = init-token-arguments ;
                                                                                                                    TOKEN_PASTE_1 = init-token-paste-1 ;
                                                                                                                    TOKEN_PASTE_2 = init-token-paste-2 ;
                                                                                                                    TOKEN_STANDARD_INPUT = init-token-standard-input ;
                                                                                                                    TOKEN_1 = harvest.temporary.util.token ;
                                                                                                                    TYPEOF = init-typeOf ;
                                                                                                                } ;
                                                                                                    } ;
                                                                                            release =
                                                                                                script
                                                                                                    {
                                                                                                        executable = pkgs.writeScript "init" ( builtins.readFile ( self + "/scripts/test/temporary/release.sh" ) ) ;
                                                                                                        sets =
                                                                                                            harvest :
                                                                                                                {
                                                                                                                    CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                    ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                    IDENTITY = harvest.temporary.util.identity ;
                                                                                                                    NAME = name ;
                                                                                                                    SPEED = speed ;
                                                                                                                    STANDARD_ERROR = release-standard-error ;
                                                                                                                    STANDARD_OUTPUT = release-standard-output ;
                                                                                                                    STATUS = release-status ;
                                                                                                                    TEE = "${ pkgs.coreutils }/bin/tee" ;
                                                                                                                    TOKEN_ARGUMENTS = release-token-arguments ;
                                                                                                                    TOKEN_PASTE_1 = release-token-paste-1 ;
                                                                                                                    TOKEN_PASTE_2 = release-token-paste-2 ;
                                                                                                                    TOKEN_STANDARD_INPUT = release-token-standard-input ;
                                                                                                                    TOKEN_1 = harvest.temporary.util.token ;
                                                                                                                    TYPEOF = release-typeOf ;
                                                                                                                } ;
                                                                                                    } ;
                                                                                            post =
                                                                                                script
                                                                                                    {
                                                                                                        executable = pkgs.writeScript "post" ( builtins.readFile ( self + "/scripts/test/temporary/post.sh" ) ) ;
                                                                                                        sets =
                                                                                                            harvest :
                                                                                                                {
                                                                                                                    CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                    CP = "${ pkgs.coreutils }/bin/cp" ;
                                                                                                                    DIFF = "${ pkgs.diffutils }/bin/diff" ;
                                                                                                                    ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                    EXPECTED = harvest.temporary.util.post.expected ;
                                                                                                                    FIND = "${ pkgs.findutils }/bin/find" ;
                                                                                                                    FLOCK = "${ pkgs.flock }/bin/flock" ;
                                                                                                                    INDEX = "${ builtins.toString index }" ;
                                                                                                                    MKDIR = "${ pkgs.coreutils }/bin/mkdir" ;
                                                                                                                    OBSERVED = harvest.temporary.util.post.observed ;
                                                                                                                    RM = "${ pkgs.coreutils }/bin/rm" ;
                                                                                                                    YQ = "${ pkgs.yq }/bin/yq" ;
                                                                                                                } ;
                                                                                                    } ;
                                                                                        } ;
                                                                            } ;
                                                                    in builtins.map mapper list ;
                                                            in builtins.foldl' pkgs.lib.recursiveUpdate { } rows ;
                                                    in
                                                        lib
                                                            {
                                                                at =
                                                                    pkgs.writeShellScript
                                                                        "at"
                                                                        ''
                                                                            ${ pkgs.coreutils }/bin/cat | ${ pkgs.bash }/bin/bash &
                                                                        '' ;
                                                                resource = "ae5a1299ab2a1c89f07bf9a6ef750fa4a518754d174f230493d4351f2e43d060b69c2079e75f60e62d24e178552a074c42a0ca449fcddf9716a3a95d44426299" ;
                                                                target = "e55dd2c8db9b224d0d6207c430354f481ece26fbf458400726e7624bcc79fcb72de81bccc55a066ebfa569317862dec4b13ea6bb4b1e8b0300f1dc867e51503d" ;
                                                                temporary =
                                                                    {
                                                                        temporary = temporary ;
                                                                        util =
                                                                            {
                                                                                identity =
                                                                                    script :
                                                                                        {
                                                                                            init =
                                                                                                script
                                                                                                    {
                                                                                                        executable = pkgs.writeShellScript "expected" ( builtins.readFile ( self + "/scripts/test/util/identity.sh" ) ) ;
                                                                                                        sets =
                                                                                                            {
                                                                                                                CUT = "${ pkgs.coreutils }/bin/cut" ;
                                                                                                                ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                SHA512SUM = "${ pkgs.coreutils }/bin/sha512sum" ;
                                                                                                            } ;
                                                                                                    } ;
                                                                                    } ;
                                                                                post =
                                                                                    {
                                                                                        expected =
                                                                                            script :
                                                                                                {
                                                                                                    init =
                                                                                                        script
                                                                                                            {
                                                                                                                executable = pkgs.writeShellScript "expected" ( builtins.readFile ( self + "/scripts/test/util/post/expected/init.sh" ) ) ;
                                                                                                                sets =
                                                                                                                    {
                                                                                                                        CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                        CUT = "${ pkgs.coreutils }/bin/cut" ;
                                                                                                                        ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                        JQ = "${ pkgs.jq }/bin/jq" ;
                                                                                                                        MD5SUM = "${ pkgs.coreutils }/bin/md5sum" ;
                                                                                                                        SED = "${ pkgs.gnused }/bin/sed" ;
                                                                                                                        TEMPLATE_FILE = builtins.toFile "expected.json" ( ( builtins.toJSON ( builtins.import ( self + "/templates/method.yaml" ) ) ) ) ;
                                                                                                                        YQ = "${ pkgs.yq }/bin/yq" ;
                                                                                                                    } ;
                                                                                                            } ;
                                                                                                } ;
                                                                                        observed =
                                                                                            script :
                                                                                                {
                                                                                                    init =
                                                                                                        script
                                                                                                            {
                                                                                                                executable = pkgs.writeShellScript "observed" ( builtins.readFile ( self + "/scripts/test/util/post/observed/init.sh" ) ) ;
                                                                                                                sets =
                                                                                                                    {
                                                                                                                        BASENAME = "${ pkgs.coreutils }/bin/basename" ;
                                                                                                                        CAT = "${ pkgs.coreutils }/bin/cat" ;
                                                                                                                        CHMOD = "${ pkgs.coreutils }/bin/chmod" ;
                                                                                                                        ECHO = "${ pkgs.coreutils }/bin/echo" ;
                                                                                                                        FIND = "${ pkgs.findutils }/bin/find" ;
                                                                                                                        SED = "${ pkgs.gnused }/bin/sed" ;
                                                                                                                        SORT = "${ pkgs.coreutils }/bin/sort" ;
                                                                                                                        YQ = "${ pkgs.yq }/bin/yq" ;
                                                                                                                    } ;
                                                                                                            } ;
                                                                                                } ;
                                                                                    } ;
                                                                                token =
                                                                                    script :
                                                                                        {
                                                                                            init = script { executable = pkgs.writeShellScript "token-init" ( builtins.readFile ( self + "/scripts/test/util/token.sh" ) ) ; sets = { CHMOD = "${ pkgs.coreutils }/bin/chmod" ; CUT = "${ pkgs.coreutils }/bin/cut" ; ECHO = "${ pkgs.coreutils }/bin/echo" ; SHA512SUM = "${ pkgs.coreutils }/bin/sha512sum" ; TEE = "${ pkgs.coreutils }/bin/tee" ; } ; } ;
                                                                                        } ;
                                                                            } ;
                                                                    } ;
                                                                temporary-path = "bdc6a3ee36ba1101872a7772344634fb07cf5dee5e77970db3dee38e697c0c1379d433ea03d0b61975f8d980d3dcc3c6516ff67db042cacf10cb3c27be1faf9b" ;
                                                            } ;
                                            in
                                                pkgs.stdenv.mkDerivation
                                                    {
                                                        name = "temporary-test" ;
                                                        nativeBuildInputs = [ pkgs.makeWrapper ] ;
                                                        src = ./. ;
                                                        installPhase =
                                                            let
                                                                mapper =
                                                                    path : name : value :
                                                                        if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                        else if builtins.typeOf value == "string" then
                                                                            let
                                                                                arguments = "${ pkgs.coreutils }/bin/timeout 10s ${ value } ${ builtins.elemAt path 3 }" ;
                                                                                echo = builtins.concatStringsSep "" [ "$" "{" "ECHO" "}" ] ;
                                                                                standard-input =
                                                                                    let
                                                                                        standard-input = builtins.elemAt path 4 ;
                                                                                        in if standard-input == "_" then arguments else "${ pkgs.coreutils }/bin/timeout 10s ${ echo } ${ standard-input } | ${ arguments }" ;
                                                                                status =
                                                                                    let
                                                                                        status = builtins.elemAt path 2 ;
                                                                                        # in if status == "0" then "ALPHA=$( ${ standard-input } ) && ${ echo } \"paste: ${ builtins.substring 0 8 ( builtins.hashString "sha512" ( builtins.concatStringsSep "/" path ) ) }\" >> ${ builtins.concatStringsSep "" [ "$" "{" "ALPHA" "}" ] }" else "! ${ standard-input }" ;
                                                                                        in if status == "0" then "${ echo } \"paste: ${ builtins.substring 0 8 ( builtins.hashString "sha512" ( builtins.concatStringsSep "/" path ) ) }\" >> $( ${ standard-input } )" else "! ${ standard-input }" ;
                                                                                in [ "#" ( builtins.concatStringsSep " " [ "# ${ builtins.concatStringsSep "" [ "$" "{" "$" "}" ] }" ( builtins.concatStringsSep " / " path ) ">&2" ] ) status status ]
                                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a set nor a string." ;
                                                                mapper2 =
                                                                    path : name : value :
                                                                        if builtins.typeOf value == "set" then builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper2 ( builtins.concatLists [ path [ name ] ] ) ) value ) )
                                                                        else if builtins.typeOf value == "string" then
                                                                            let
                                                                                arguments = "${ command } ${ builtins.elemAt path 1 }" ;
                                                                                command_ = "resources . temporary . temporary . ${ ( builtins.concatStringsSep " . " ( builtins.map ( x : builtins.concatStringsSep "" [ "\"" x "\"" ] ) ( builtins.concatLists [ path [ name ] ] ) ) ) }" ;
                                                                                command = builtins.concatStringsSep "" [ "$" "{" " " command_ " " "}" ] ;
                                                                                echo = builtins.concatStringsSep "" [ "$" "{" " " "echo" " " "}" ] ;
                                                                                standard-input =
                                                                                    let
                                                                                        standard-input = builtins.elemAt path 2 ;
                                                                                        in if standard-input == "_" then arguments else "${ echo } ${ standard-input } | ${ arguments }" ;
                                                                                status =
                                                                                    let
                                                                                        status = builtins.elemAt path 0 ;
                                                                                        in if status == "0" then "${ echo } \"paste: ${ builtins.substring 0 8 ( builtins.hashString "sha512" ( builtins.concatStringsSep "/" path ) ) }\" >> $( ${ standard-input } )" else "! ${ standard-input }" ;
                                                                                in [ "#" status status status "#" ]
                                                                        else builtins.throw "The temporary defined at ${ builtins.concatStringsSep " / " path } / ${ name } is neither a set nor a string." ;
                                                                 in
                                                                    ''
                                                                        ${ pkgs.coreutils }/bin/mkdir $out &&
                                                                            cleanup ( )
                                                                                {
                                                                                    ${ pkgs.coreutils }/bin/echo $out
                                                                                } &&
                                                                            trap cleanup EXIT &&
                                                                            ${ pkgs.coreutils }/bin/mkdir $out/bin &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/diff.sh" } $out/bin/diff.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/diff.sh &&
                                                                            makeWrapper $out/bin/diff.sh $out/bin/diff --set DIFF ${ pkgs.diffutils }/bin/diff --set SELF $out &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-expectate.sh" } $out/bin/re-expectate.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-expectate.sh &&
                                                                            makeWrapper $out/bin/re-expectate.sh $out/bin/re-expectate --set CP ${ pkgs.coreutils }/bin/cp --set GIT ${ pkgs.git }/bin/git --set OBSERVED $out/observed --set TOUCH ${ pkgs.coreutils }/bin/touch &&
                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/observed-external.sh" } $out/bin/observed-external.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/observed-external.sh &&
                                                                            makeWrapper $out/bin/observed-external.sh $out/bin/observed-external --set BASH ${ pkgs.bash }/bin/bash --set FIND ${ pkgs.findutils }/bin/find --set GREP ${ pkgs.gnugrep }/bin/grep --set MKDIR ${ pkgs.coreutils }/bin/mkdir --set OBSERVED_INTERNAL $out/bin/observed-internal --set SLEEP ${ pkgs.coreutils }/bin/sleep --set WC ${ pkgs.coreutils }/bin/wc &&

                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/re-observate.sh" } $out/bin/re-observate.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/re-observate.sh &&
                                                                            makeWrapper $out/bin/re-observate.sh $out/bin/re-observate --set ECHO ${ pkgs.coreutils }/bin/echo --set OBSERVATE_FILE ${ builtins.toFile "observed-internal.nix" ( builtins.concatStringsSep " &&\n\t" ( builtins.concatLists ( builtins.attrValues ( builtins.mapAttrs ( mapper2 [ ] ) resources.temporary.temporary ) ) ) ) } --set SED ${ pkgs.gnused }/bin/sed &&

                                                                            ${ pkgs.coreutils }/bin/ln --symbolic ${ pkgs.writeShellScript "observed-internal" ( builtins.concatStringsSep " &&\n" [ ( builtins.import ( self + "/scripts/test/util/observed-internal.nix" ) resources "${ pkgs.coreutils }/bin/echo" ) "${ builtins.concatStringsSep "" [ "$" "{" "SLEEP" "}" ] } 10s" "${ builtins.concatStringsSep "" [ "$" "{" "FIND" "}" ] } /build -mindepth 2 -maxdepth 2 -type f -name temporary -exec ${ builtins.concatStringsSep "" [ "$" "{" "GREP" "}" ] } ^temporary {} \\; | ${ builtins.concatStringsSep "" [ "$" "{" "WC" "}" ] } --lines > /build/observed/temporary/count.mid" ] ) } $out/bin/observed-internal.sh &&
                                                                            makeWrapper $out/bin/observed-internal.sh $out/bin/observed-internal --set ECHO ${ pkgs.coreutils }/bin/echo --set FIND ${ pkgs.findutils }/bin/find --set GREP ${ pkgs.gnugrep }/bin/grep --set SLEEP ${ pkgs.coreutils }/bin/sleep --set WC ${ pkgs.coreutils }/bin/wc &&

                                                                            ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/test/util/test-external.sh" } $out/bin/test-external.sh &&
                                                                            ${ pkgs.coreutils }/bin/chmod 0555 $out/bin/test-external.sh &&
                                                                            makeWrapper $out/bin/test-external.sh $out/bin/test-external --set BASH_UNIT ${ pkgs.bash_unit }/bin/bash_unit --set DIFF ${ pkgs.diffutils }/bin/diff --set ECHO ${ pkgs.coreutils }/bin/echo --set EXPECTED ${ self + "/expected" } --set FIND ${ pkgs.findutils }/bin/find --set OBSERVED $out/observed --set TEST_INTERNAL ${ self + "/scripts/test/util/test-internal.sh" } &&
                                                                            $out/bin/observed-external &&
                                                                            ${ pkgs.coreutils }/bin/mv /build/observed $out/observed &&
                                                                            if [ -f ${ self + "/scripts/.gitignore" } ]
                                                                            then
                                                                                ${ pkgs.coreutils }/bin/cp ${ self + "/scripts/.gitignore" } $out/observed/.gitignore
                                                                            else
                                                                                ${ pkgs.coreutils }/bin/touch $out/observed/.gitignore
                                                                            fi
                                                                            $out/bin/test-external &&
                                                                            exit ${ builtins.toString 0 }
                                                                    '' ;
                                                    } ;
                                    lib = lib ;
                                } ;
                in flake-utils.lib.eachDefaultSystem fun ;
}
