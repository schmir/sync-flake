# List available recipes
@_default:
    just --list

# Show metadata
info:
    nix flake metadata

_commit msg:
    jj describe -m '{{msg}}'
    jj bookmark set main -r @
    jj git push

_flake-update *ARGS:
    nix flake update {{ARGS}}

_begin-code-change:
    jj git fetch
    jj new main

# Update nixpkgs only
update: _begin-code-change (_flake-update "nixpkgs") (_commit "Update nixpkgs inputs")

# Update flake inputs, commit and push to github
update-all: _begin-code-change (_flake-update) (_commit "Update all inputs")
