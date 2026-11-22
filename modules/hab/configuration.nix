{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../core/default.nix
  ];

  networking.hostName = "hab";

  powerManagement.powertop.enable = true;

  environment.systemPackages = with pkgs; [
  ];

  services.qemuGuest.enable = true;

  services.caddy = {
    # TODO: use this to replace NPM completely
    # I'll need to setup sops or something to manage the api key
    enable = true;
    openFirewall = true;
    globalConfig = ''
      default_sni pancake.hab.internal
    '';
    virtualHosts."pancake.hab.internal" = {
      serverAliases = [ "pancake.thepriest.family" ];
      extraConfig = ''
        tls internal
        reverse_proxy 127.0.0.1:6868
      '';
    };
  };

  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  virtualisation.oci-containers = {
    containers = {
      pancakeslicer = {
        autoStart = true;
        image = "ghcr.io/zimengxiong/pancakeslicer:latest";
        ports = [ "127.0.0.1:6868:6868" ];
        volumes = [ "pancakeslicer-data:/data" ];
        environment = {
          ORCA_WEB_PRINTER_NETWORK = "klipper.internal";
        };
      };
    };
  };

  system.stateVersion = "26.05"; # Did you read the comment?
}
