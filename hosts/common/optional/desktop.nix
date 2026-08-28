{ pkgs, ... }:

{
  programs.firefox.enable = true;
  
  environment.systemPackages = with pkgs; [
    ladybird
    obsidian
    pulseaudio
    vivaldi
    watchmate
  ];

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  services.keyd = {
   enable = true;
   keyboards.default.settings = {
      main.capslock = "escape";
   };
  };
}
