{
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.probe-rs-rules.nixosModules."x86_64-linux".default
    ./hardware-configuration.nix
    ../core/default.nix
    ../optional/workstation.nix
  ];

  networking.hostName = "laptop";
  networking.wireguard.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    fw-ectool
    remmina
    wireguard-tools
  ];

  services.udev.packages = [
    pkgs.game-devices-udev-rules
    (pkgs.writeTextFile {
      name = "ingenic-dfu-udev-rules";
      destination = "/etc/udev/rules.d/51-ingenic-dfu.rules";
      text = ''
        SUBSYSTEM=="usb", ATTR{idVendor}=="a108", MODE="0666", TAG+="uaccess"
        SUBSYSTEM=="usb", ATTR{idVendor}=="601a", MODE="0666", TAG+="uaccess"
      '';
    })
  ];

  services.framework-control.enable = true;

  services.logind.settings.Login = {
    HandlePowerKey = "suspend";
  };

  # Fix for Intel AX210 bluetooth issues
  boot.extraModprobeConfig = ''
    options iwlwifi bt_coex_active=0
    options iwlwifi swcrypto=1
    options iwlwifi power_save=0
    options iwlwifi uapsd_disable=1
    options iwlwifi d0i3_disable=1
    options iwlmvm power_scheme=1
  '';

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        ControllerMode = "bredr";
        Experimental = true;
        FastConnectable = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };

  hardware.probe-rs.enable = true;

  system.stateVersion = "25.05";
}
