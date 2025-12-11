{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    neovim
    tree
    wget
    zellij
  ];

  environment.variables.EDITOR = "nvim";

  services.tailscale.enable = true;
}
