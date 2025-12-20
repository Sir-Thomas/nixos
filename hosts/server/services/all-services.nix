{ ... }:

{
  imports = [
    ./audiobookshelf.nix
    ./homeassistant.nix
    ./openreader.nix
  ];
  virtualisation.podman.defaultNetwork.settings.dns_enabled = true;
  virtualisation.oci-containers.backend = "podman";
}
