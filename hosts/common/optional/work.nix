{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    microsoft-edge
    omnissa-horizon-client
  ];
}
