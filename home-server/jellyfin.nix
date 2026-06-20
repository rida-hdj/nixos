{
  config,
  pkgs,
  lib,
  ...
}:

{

  #Enable jellyfin
  services.jellyfin = {
    enable = false;
    openFirewall = true;
  };

}
