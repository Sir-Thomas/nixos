{ inputs, pkgs, ... }:

{
  imports = [
    inputs.probe-rs-rules.nixosModules."x86_64-linux".default
    ./hardware-configuration.nix
    ../core/default.nix
    ../optional/workstation.nix
  ];

  networking.hostName = "desktop";

  environment.systemPackages = with pkgs; [
  ];

  hardware.bluetooth.enable = true;

  hardware.probe-rs.enable = true;

  system.stateVersion = "25.11";
}
