{
  pkgs,
  ...
}:

{

  hardware.graphics.enable32Bit = true;

  # Bootloader
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      gfxmodeBios = "1280x1024";
      gfxmodeEfi = "1280x1024";
      gfxpayloadBios = "keep";
      gfxpayloadEfi = "keep";
      theme = pkgs.catppuccin-grub.override {
        flavor = "mocha";
      };
    };
    efi.canTouchEfiVariables = true;
  };

  #Enable plymouth
  /*
    boot = {
      plymouth = {
        enable = true;
        theme = "catppuccin-mocha";
        themePackages = with pkgs; [
          (catppuccin-plymouth.override {
            variant = "mocha";
          })
        ];
      };
      initrd.kernelModules = [ "i915" ];
      initrd.systemd.enable = true;
      initrd.verbose = false;
      consoleLogLevel = 0;
      kernelParams = [
        "quiet"
        "splash"
        "video=1280x1024"
      ];
    };
  */

  #Kernel version
  boot.kernelPackages = pkgs.linuxPackages_zen;

}
