{ ... }:

{
  imports = 
    [
      ./systemd-boot.nix
      ./networkmanager.nix
      ./timezone.nix
      ./core-packages.nix
      ./fonts.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
