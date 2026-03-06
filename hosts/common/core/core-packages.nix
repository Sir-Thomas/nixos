{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    bitwarden-desktop
    eza
    git
    helix
    ripgrep
    usbutils
    zellij
  ];

  environment.variables.EDITOR = "hx";

  services.tailscale.enable = true;
}
