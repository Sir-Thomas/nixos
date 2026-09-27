{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    fd
    git
    just
    nixfmt-rs
    ripgrep
    usbutils
    zellij
  ];

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";
}
