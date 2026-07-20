{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    eza
    git
    helix
    neovim
    ripgrep
    usbutils
    zellij
  ];

  environment.variables.EDITOR = "hx";

  services.tailscale.enable = true;
}
