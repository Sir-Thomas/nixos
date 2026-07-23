{ config, pkgs, ... }:

{
  home.username = "tommy";
  home.homeDirectory = "/home/tommy";
  home.stateVersion = "25.11";
  programs = {
    git = {
      enable = true;
      settings = {
        user.name = "Sir-Thomas";
        user.email = "tp8153@gmail.com";
        init.defaultBranch = "main";
      };
    };
    bash = {
      enable = true;
      shellAliases = {
        nrs = "sudo nixos-rebuild switch --flake ~/nixos/";
        nrb = "sudo nixos-rebuild boot --flake ~/nixos/";
        gc = "sudo nix-collect-garbage -d";
        cb = "sudo /run/current-system/bin/switch-to-configuration boot";
        tofi-fix = "rm ~/.cache/tofi-drun";
	vi = "nvim";
	vim = "nvim";
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
