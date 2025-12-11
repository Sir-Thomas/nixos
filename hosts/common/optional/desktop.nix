{ pkgs, ... }:

{
  imports = 
    [
      ./hyprland.nix
    ];

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    foot
    obsidian
    pulseaudio
    tofi
    waybar
  ];
}
