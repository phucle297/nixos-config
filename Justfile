# List all the just commands
default:
    @just --list

# List all generations of the system profile
[group('nix')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

[group('nix')]
deploy:
  sudo nixos-rebuild switch --flake .#nixos && notify-send "System Rebuild Sucess" "Done built" || notify-send "System Rebuild Failed"

# update flake
[group('nix')]
up:
  nix flake update

# remove all generations older than 7 days
[group('nix')]
clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

# garbage collect all unused nix store entries
[group('nix')]
gc:
  sudo nix-collect-garbage --delete-old
