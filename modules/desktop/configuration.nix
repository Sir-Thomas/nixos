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
      OLLAMA_CONTEXT_LENGTH = "32768";
      OLLAMA_KV_CACHE_TYPE = "q8_0";
    };
  };

  hardware.bluetooth.enable = true;

  hardware.probe-rs.enable = true;

  system.stateVersion = "25.11";
}
