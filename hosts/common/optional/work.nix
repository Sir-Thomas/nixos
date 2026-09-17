{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    microsoft-edge
    omnissa-horizon-client
    stoken
  ];

  services.desktopManager.gnome.enable = true;
  # services.displayManager.gdm.enable = true;
}
