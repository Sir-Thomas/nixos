{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    microsoft-edge
    omnissa-horizon-client
    stoken
  ];

  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  home-manager.users.tommy.imports = [
    ../../home/work.nix
  ];
}
