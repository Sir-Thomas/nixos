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

  services.udev.packages = [
    pkgs.game-devices-udev-rules
    (pkgs.writeTextFile {
      name = "zsa-udev-rules";
      destination = "/etc/udev/rules.d/50-zsa.rules";
      text = ''
        # Rules for Oryx web flashing and live training
        KERNEL=="hidraw*", ATTRS{idVendor}=="16c0", MODE="0664", GROUP="plugdev"
        KERNEL=="hidraw*", ATTRS{idVendor}=="3297", MODE="0664", GROUP="plugdev"

        # Keymapp / Wally Flashing rules for the Moonlander and Planck EZ
        SUBSYSTEMS=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE:="0666", SYMLINK+="stm32_dfu"
      '';
    })
  ];

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
