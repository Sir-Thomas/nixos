{ ... }:

{
  virtualisation.oci-containers.openreader = {
    image = "ghcr.io/richardr1126/openreader-webui:latest";
    volumes = [ "openreader_docstore:/app/docstore" ];
    ports = [ "3003:3003" ];
    environment = {
      API_KEY = "none";
      API_BASE = "http://desktop-windows:8880/v1";
    };
  };
}
