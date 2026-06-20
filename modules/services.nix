{
  ...
}:

{

  #Enable zram
  zramSwap = {
    enable = false;
    algorithm = "zstd";
    memoryPercent = 80;
  };

  services.fwupd.enable = true;

  #Enable dbus
  services.dbus.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #Enable file manager extras
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  #Enable gnome disks
  programs.gnome-disks.enable = true;
  services.udisks2.enable = true;

  #Enable flatpak
  services.flatpak.enable = true;

  #Enable steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

}
