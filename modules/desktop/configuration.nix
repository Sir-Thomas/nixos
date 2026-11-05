{ inputs, pkgs, ... }:

{
  imports = [
    inputs.probe-rs-rules.nixosModules."x86_64-linux".default
    ./hardware-configuration.nix
    ../core/default.nix
    ../optional/workstation.nix
  ];

  networking.hostName = "desktop";

  environment.systemPackages = with pkgs; [
  ];

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
    host = "0.0.0.0";
    openFirewall = true;
    environmentVariables = {
      OLLAMA_CONTEXT_LENGTH = "131072";
      OLLAMA_KV_CACHE_TYPE = "q8_0";
    };
  };

  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    openFirewall = true;
    environment = {
      ANONYMIZED_TELEMETRY = "False";
      DO_NOT_TRACK = "True";
      SCARF_NO_ANALYTICS = "True";
      OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
    };
  };

  hardware.bluetooth.enable = true;

  hardware.probe-rs.enable = true;

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 32 * 1024;
    }
  ];

  system.stateVersion = "25.11";
}
