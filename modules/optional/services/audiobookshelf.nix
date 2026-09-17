{ ... }:

{
  virtualisation.oci-containers.containers.audiobookshelf = {
    image = "ghcr.io/advplyr/audiobookshelf:latest";
    volumes = [
      "audiobooks:/audiobooks"
      "podcasts:/podcasts"
      "audiobookshelf-config:/config"
      "audiobookshelf-metadata:/metadata"
    ];
    environment.TZ = "America/Chicago";
    ports = [ "13378:80" ];
  };
}
