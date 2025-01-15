# List available recipes
default:
    just --list

# Show metadata
info:
    nix flake metadata

# Update flake inputs, commit and push to github
update:
    nix flake update
    git add flake.lock
    git commit -m 'Update flake inputs'
    git push
