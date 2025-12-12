{ ... }:

{
  users.extraGroups.plugdev = { };
  users.extraGroups.dialout = { };
  users.users.tommy = {
    isNormalUser = true;
    extraGroups = [ "wheel" "plugdev" "dialout" ];
  };

  security.sudo.wheelNeedsPassword = false;
}
