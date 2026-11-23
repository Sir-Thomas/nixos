{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bat
    fd
    git
    just
    nixfmt-rs
    ripgrep
    unzip
    usbutils
    zellij
  ];

  environment.variables.EDITOR = "nvim";
  environment.variables.VISUAL = "nvim";
}
