#! /nix/store/p6k7xp1lsfmbdd731mlglrdj2d66mr82-bash-5.2p37/bin/bash -e
export AT='/run/wrappers/bin/at'
export CAT='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/cat'
export CHMOD='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/chmod'
export DIRNAME='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/dirname'
export ECHO='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/echo'
export GRANDPARENT_PID=$( /nix/store/j4042aswh3kcc8cz44kr8w011jyl8lk2-procps-4.0.4/bin/ps -p $( /nix/store/j4042aswh3kcc8cz44kr8w011jyl8lk2-procps-4.0.4/bin/ps -p ${$} -o ppid= ) -o ppid= )
export IS_PIPE=$( if [ -f /proc/self/fd/0 ] ; then /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/echo /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/true ; else /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/echo /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/false ; fi )
export IS_INTERACTIVE=$( if [ -t 0 ] ; then /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/echo /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/true ; else /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/echo /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/false ; fi )
export IS_PIPE=$( if [ -p /proc/self/fd/0 ] ; then /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/echo /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/true ; else /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/echo /nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/false ; fi )
export GREP='/nix/store/85amyk92rg19l4fy0qmy7wr4jmq8p5z0-gnugrep-3.11/bin/grep'
export INIT='/nix/store/129w73aadrh43csywgk98zxfkx7x2hbv-temporary-implementation/d6781b289eb6c6e3686f667be10a0789a23acf64958f81ef31a0c83fd37507c78c49f56d6613106b9918914258fe41ba7a294d550ef1a3135b18e9b2ce8ec66c/init.sh'
export INITIALIZATION_ERROR_STANDARD_ERROR='64'
export INITIALIZATION_ERROR_INITIALIZER='65'
export LN='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/ln'
export MKTEMP='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/mktemp'
export MV='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/mv'
export NICE='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/nice'
export PS='/nix/store/cbibkmczi374l8lvlbc2cl2ipchkvbz2-ps-procps-4.0.4/bin/ps'
export READLINK='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/readlink'
export RELEASE='/nix/store/129w73aadrh43csywgk98zxfkx7x2hbv-temporary-implementation/d6781b289eb6c6e3686f667be10a0789a23acf64958f81ef31a0c83fd37507c78c49f56d6613106b9918914258fe41ba7a294d550ef1a3135b18e9b2ce8ec66c/release.sh'
export PARENT_PID=$( /nix/store/j4042aswh3kcc8cz44kr8w011jyl8lk2-procps-4.0.4/bin/ps -p ${$} -o ppid= )
export POST='/nix/store/129w73aadrh43csywgk98zxfkx7x2hbv-temporary-implementation/d6781b289eb6c6e3686f667be10a0789a23acf64958f81ef31a0c83fd37507c78c49f56d6613106b9918914258fe41ba7a294d550ef1a3135b18e9b2ce8ec66c/post.sh'
export RM='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/rm'
export TAIL='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/tail'
export TEARDOWN_ASYNCH='/nix/store/129w73aadrh43csywgk98zxfkx7x2hbv-temporary-implementation/d6781b289eb6c6e3686f667be10a0789a23acf64958f81ef31a0c83fd37507c78c49f56d6613106b9918914258fe41ba7a294d550ef1a3135b18e9b2ce8ec66c/teardown-asynch'
export TEARDOWN_SYNCH='/nix/store/129w73aadrh43csywgk98zxfkx7x2hbv-temporary-implementation/d6781b289eb6c6e3686f667be10a0789a23acf64958f81ef31a0c83fd37507c78c49f56d6613106b9918914258fe41ba7a294d550ef1a3135b18e9b2ce8ec66c/teardown-synch'
export TEE='/nix/store/b1wvkjx96i3s7wblz38ya0zr8i93zbc5-coreutils-9.5/bin/tee'
export TEMPORARY_RESOURCE_MASK='checks.temporary.XXXXXXXX'
exec "/nix/store/129w73aadrh43csywgk98zxfkx7x2hbv-temporary-implementation/d6781b289eb6c6e3686f667be10a0789a23acf64958f81ef31a0c83fd37507c78c49f56d6613106b9918914258fe41ba7a294d550ef1a3135b18e9b2ce8ec66c/setup.sh"  "$@" 
