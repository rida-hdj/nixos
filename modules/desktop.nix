{
  pkgs,
  ...
}:

{

  #Enable niri
  programs.niri.enable = true;

  #Enable kde
  services.desktopManager.plasma6 = {
    enable = false;
  };

  #Enable kde connect
  programs.kdeconnect.enable = true;

  # Enable DM
  services.displayManager.ly.enable = true;

  #Enable xserver
  services.xserver = {
    enable = true;
  };

  #Enable xdg-desktop-portal
  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    config.common.default = "gtk";
  };

}
