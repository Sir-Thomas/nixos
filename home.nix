{ config, pkgs, ... }:

{
  home.username = "tommy";
  home.homeDirectory = "/home/tommy";
  home.stateVersion = "24.05";
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user.name = "Sir-Thomas";
      user.email = "tp8153@gmail.com";
    };
  };
  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
      fi
    '';
  };
  home.file.".config/hypr".source = ./hypr;
  home.file.".config/waybar".source = ./waybar;
  home.file.".config/foot".source = ./foot;
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };
}
