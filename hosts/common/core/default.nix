{ ... }:

{
  imports = 
    [
      ./core-packages.nix
      ./fonts.nix
      ./networkmanager.nix
      ./systemd-boot.nix
      ./timezone.nix
      ./users.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
}
