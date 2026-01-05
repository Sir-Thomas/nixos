{ config, pkgs, ... }:

{
  home.username = "tommy";
  home.homeDirectory = "/home/tommy";
  home.stateVersion = "24.05";
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
        gc = "sudo nix-collect-garbage -d";
        cb = "sudo /run/current-system/bin/switch-to-configuration boot";
        tofi-fix = "rm ~/.cache/tofi-drun";
      };
    };
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
  };
  home.file.".config/nvim".source = ./nvim;
}
