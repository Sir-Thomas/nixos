{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    tree
    usbutils
    wget
    zellij
  ];

  environment.variables.EDITOR = "nvim";

  services.tailscale.enable = true;
}
