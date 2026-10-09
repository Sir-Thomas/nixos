{ pkgs, ... }:

let
  horizonGamescope = pkgs.writeShellScriptBin "horizon-gamescope" ''
    W=1920
    H=1080
    FPS=60

    exec ${pkgs.gamescope}/bin/gamescope \
      -w $W -h $H \
      -W $W -H $H \
      -r $FPS \
      -- horizon-client "$@"
  '';

in
{
  home.packages = [ horizonGamescope ];

  xdg.desktopEntries.omnissa-horizon-gamescope = {
    name = "Omnissa Horizon Client (Gamescope)";
    exec = "${horizonGamescope}/bin/horizon-gamescope %u";
    terminal = false;
    type = "Application";
    icon = "vmware-horizon-client";
    mimeType = [
      "x-scheme-handler/horizon-client"
      "x-scheme-handler/vmware-view"
    ];
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "x-scheme-handler/horizon-client" = [ "omnissa-horizon-gamescope" ];
      "x-scheme-handler/vmware-view" = [ "omnissa-horizon-gamescope" ];
    };
  };
}
