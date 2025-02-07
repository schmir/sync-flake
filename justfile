# List available recipes
@_default:
    just --list

# Show metadata
info:
    nix flake metadata

@_commit msg:
    git add flake.lock
    git commit -m '{{msg}}'
    git push

# Update nixpkgs only
update:
    nix flake update nixpkgs
    @{{just_executable()}} -f {{justfile()}} _commit "Update nixpkgs inputs"

# Update flake inputs, commit and push to github
update-all:
    nix flake update
    @{{just_executable()}} -f {{justfile()}} _commit "Update all inputs"
