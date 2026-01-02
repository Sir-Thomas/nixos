{ pkgs, ... }:

{
  imports = 
    [
      ./hyprland.nix
    ];

  programs.firefox.enable = true;
  
  environment.systemPackages = with pkgs; [
    foot
    loupe
    obsidian
    pulseaudio
    tofi
    watchmate
    waybar
  ];
}
