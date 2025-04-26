```
nix-collect-garbage -d &&
echo BEFORE &&
date &&
echo AA &&
nix flake check &&
echo BB &&
nix run .#0-0-0 &&
echo CC &&
nix run .#0-0-1 &&
echo DD &&
nix run .#0-1-0 &&
echo EE &&
nix run .#0-1-1 &&
echo FF &&
nix run .#1-0-0 &&
echo GG &&
nix run .#1-0-1 &&
echo HH &&
nix run .#1-1-0 &&
echo II &&
nix run .#1-1-1 &&
date &&
echo AFTER &&
git commit -am "" 
`
```