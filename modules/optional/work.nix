{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    microsoft-edge
    omnissa-horizon-client
    stoken
  ];

  services.desktopManager.gnome.enable = true;
  # Cosmic doesn't like it when gnome does ibus things
  # This line turns that off
  i18n.inputMethod.enable = false;
}
