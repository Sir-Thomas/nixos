{ ... }:

{
  virtualisation.oci-containers.homeassistant = {
    image = "ghcr.io/home-assistant/home-assistant:stable";
    volumes = [ "home-assistant:/config" ];
    environment.TZ = "America/Chicago";
    devices = [ "/dev/ttyUSB0:/dev/ttyUSB0" ];
    extraOptions = [ "--network=host" ];
  };
}
