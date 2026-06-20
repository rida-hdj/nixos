{
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/security.nix
    ./modules/users.nix
    ./modules/services.nix
    ./modules/networking.nix
    ./modules/desktop.nix
    ./modules/virtualisation.nix
    ./home-server/jellyfin.nix
  ];

  #--Enable nixos flakes--
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  system.stateVersion = "25.05";

}
