{ config, pkgs, ... }:

{
  home.username = "tommy";
  home.homeDirectory = "/home/tommy";
  home.stateVersion = "24.05";
  programs.git = {
    enable = true;
    settings = {
      user.name = "Sir-Thomas";
      user.email = "tp8153@gmail.com";
      init.defaultBranch = "main";
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/";
      gc = "sudo nix-collect-garbage -d";
      cb = "sudo /run/current-system/bin/switch-to-configuration boot";
    };
    profileExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
      fi
    '';
  };
  home.file.".config/hypr".source = ./configs/hypr;
  home.file.".config/waybar".source = ./configs/waybar;
  home.file.".config/foot".source = ./configs/foot;
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
}
