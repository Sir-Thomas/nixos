{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    eza
    git
    just
    lazygit
    ripgrep
    usbutils
    zellij
  ];

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";
}
