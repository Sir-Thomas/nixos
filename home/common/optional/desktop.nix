{ config, pkgs, ... }:

{
  programs.bash = {
    profileExtra = ''
      if uwsm check may-start; then
        exec uwsm start hyprland-uwsm.desktop
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
