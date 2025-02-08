git commit -am "" --allow-empty --allow-empty-message &&
  time timeout 10m nix flake check &&
  git commit -am "BAKE WORK" --allow-empty &&
  ( cat <<EOF
git push origin HEAD &&
  nix-collect-garbage &&
  nix flake check
EOF
) | at now
