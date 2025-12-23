{ ... }:

{
  virtualisation.oci-containers.containers = {
    homeassistant = {
      image = "ghcr.io/home-assistant/home-assistant:stable";
      volumes = [ "homeassistant:/config" ];
      environment.TZ = "America/Chicago";
      devices = [ "/dev/ttyUSB0:/dev/ttyUSB0" ];
      extraOptions = [ "--network=host" ];
    };
    esphome = {
      image = "ghcr.io/esphome/esphome:latest";
      volumes = [
        "esphome-config:/config"
	"/etc/localtime:/etc/localtime:ro"
      ];
      ports = [ "6052:6052" ];
    };
  };
  networking.firewall.allowedTCPPorts = [ 8123 ];
}
