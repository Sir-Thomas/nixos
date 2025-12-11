{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../common/core/default.nix
      ../common/optional/desktop.nix
      ../common/optional/gaming.nix
    ];

  networking.hostName = "laptop";

  users.extraGroups.plugdev = { };
  users.extraGroups.dialout = { };
  users.users.tommy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "plugdev" "dialout" ];
    packages = with pkgs; [
    ];
  };

  security.sudo.wheelNeedsPassword = false;

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  services.printing.enable = true;

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

  system.stateVersion = "25.05";

}

