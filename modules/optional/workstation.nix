{ pkgs, ... }:

{
  imports = [
    ./gaming.nix
    ./work.nix
  ];

  environment.systemPackages = with pkgs; [
    librewolf
    obsidian
    pulseaudio
    watchmate
  ];

  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;

  services.printing.enable = true;

  services.keyd = {
    enable = true;
    keyboards.default.settings = {
      main.capslock = "overload(control, esc)";
    };
  };
}
