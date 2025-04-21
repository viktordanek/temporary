```
`nix-collect-garbage -d &&
echo BEFORE &&
date &&
echo AAAAAAAAAAAAAAAAAAA &&
nix flake check &&
echo BBBBBBBBBBBBBBBBBBBBBBB &&
nix run .#0-0-0 &&
echo CCCCCCCCCCCCCCCCCCCCCc &&
# nix run .#0-0-1 &&
echo DDDDDDDDDDDDDDDDDDDDDD &&
nix run .#0-1-0 &&
echo EEEEEEEEEEEEEEEEEEEEE &&
# nix run .#0-1-1 &&
echo AAAAAAAAAAAAAAAAAAA &&
echo BBBBBBBBBBBBBBBBBBBBBBB &&
nix run .#1-0-0 &&
echo CCCCCCCCCCCCCCCCCCCCCc &&
# nix run .#1-0-1 &&
echo DDDDDDDDDDDDDDDDDDDDDD &&
nix run .#1-1-0 &&
echo EEEEEEEEEEEEEEEEEEEEE &&
# nix run .#1-1-1 &&
date &&
echo AFTER`
```