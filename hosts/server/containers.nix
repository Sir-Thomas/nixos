{ ... }:

{
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
  virtualisation.oci-containers = {
    backend = "podman";
    containers = {
      homeassistant = {
        volumes = [ "home-assistant:/config" ];
        environment.TZ = "America/Chicago";
        image = "ghcr.io/home-assistant/home-assistant:stable";
        devices = [ "/dev/ttyUSB0:/dev/ttyUSB0" ];
        extraOptions = [
          "--network=host"
        ];
      };
      openreader = {
        volumes = [ "openreader_docstore:/app/docstore" ];
        image = "ghcr.io/richardr1126/openreader-webui:latest";
        ports = [ "3003:3003" ];
        environment = {
          API_KEY = "none";
          API_BASE = "http://desktop-windows:8880/v1";
        };
      };
    };
  };
}
