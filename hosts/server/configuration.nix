{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../common/core/default.nix
      ./services/all-services.nix
    ];

  networking.hostName = "server"; # Define your hostname.

  powerManagement.powertop.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}

