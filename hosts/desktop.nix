{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware/desktop-hardware.nix
      ./common/optional/hyprland.nix
      ./common/core/default.nix
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

  programs.firefox.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    foot
    obsidian
    pulseaudio
    tofi
    waybar
  ];

  services.printing.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?

}
