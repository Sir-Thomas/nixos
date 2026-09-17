{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../core/default.nix
    ../optional/workstation.nix
  ];

  networking.hostName = "desktop";

  environment.systemPackages = with pkgs; [
  ];

  hardware.bluetooth.enable = true;

  system.stateVersion = "25.11";
}
