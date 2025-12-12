{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common/core/default.nix
      ../common/optional/desktop.nix
      ../common/optional/gaming.nix
    ];

  networking.hostName = "desktop";

  environment.systemPackages = with pkgs; [
  ];

  services.printing.enable = true;

  system.stateVersion = "24.05";
}
