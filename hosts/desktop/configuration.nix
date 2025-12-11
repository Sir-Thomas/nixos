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

  users.extraGroups.plugdev = { };
  users.extraGroups.dialout = { };
  users.users.tommy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "plugdev" "dialout" ];
    packages = with pkgs; [
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
  ];

  services.printing.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

}
