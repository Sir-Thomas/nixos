{ ... }:

{
  imports = [
    ./core-packages.nix
    ./fonts.nix
    ./networkmanager.nix
    ./ssh.nix
    ./systemd-boot.nix
    ./timezone.nix
    ./users.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.settings.trusted-users = [ "@wheel" ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.problems.handlers."gtk+".broken = "warn";
}
