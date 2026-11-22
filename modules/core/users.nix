{ ... }:

{
  users.extraGroups.plugdev = { };
  users.extraGroups.dialout = { };
  users.users.tommy = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "plugdev"
      "networkmanager"
      "dialout"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAM467T7+kC2jd1zXBlYuukJ57d4ICZ6KihQTIPDwpJ4 tp8153@gmail.com"
    ];
  };

  security.sudo.wheelNeedsPassword = false;
}
