{
  ...
}:

{

  # Set your time zone
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  #Enable nix-ld
  programs.nix-ld.enable = true;

  #Enable appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  #Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [
    "/share/icons"
    "/share/applications"
  ];

  environment.variables = {
    GSK_RENDERER = "ngl";

  };

}
