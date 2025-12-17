{ ... }:

{
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
  virtualisation.oci-containers = {
    backend = "podman";
    containers.homeassistant = {
      volumes = [ "home-assistant:/config" ];
      environment.TZ = "America/Chicago";
      image = "ghcr.io/home-assistant/home-assistant:stable";
      autoStart = true;
      extraOptions = [
        "--network=host"
	"--device=/dev/ttyUSB0:/dev/ttyUSB0"
      ];
    };
  };
}
