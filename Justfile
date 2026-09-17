build:
    sudo nixos-rebuild switch --flake ~/nixos/

boot:
    sudo nixos-rebuild boot --flake ~/nixos/

clean:
    sudo nix-collect-garbage -d
    sudo /run/current-system/bin/switch-to-configuration boot

update:
    nix flake update --flake ~/nixos/
    sudo nixos-rebuild switch --flake ~/nixos/
