# List available recipes
@_default:
    just --list

# Show metadata
info:
    nix flake metadata

_commit msg:
    git add flake.lock
    git commit -m '{{msg}}'
    git push

_flake-update *ARGS:
    nix flake update {{ARGS}}

# Update nixpkgs only
update: (_flake-update "nixpkgs") (_commit "Update nixpkgs inputs")

# Update flake inputs, commit and push to github
update-all: (_flake-update) (_commit "Update all inputs")
