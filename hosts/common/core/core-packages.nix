{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    eza
    git
    neovim
    ripgrep
    usbutils
    zellij
  ];

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";

  services.tailscale.enable = true;
}
