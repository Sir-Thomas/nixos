{ pkgs, ... }:

{
  programs.firefox.enable = true;
  
  environment.systemPackages = with pkgs; [
    ladybird
    obsidian
    pulseaudio
    watchmate
  ];

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
}
