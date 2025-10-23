# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
    
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

hardware.graphics.enable32Bit = true;
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
#  services.xserver.enable = true;
  # Enable hyprland
  programs.hyprland.enable = false;
#programs.hyprland.xwayland.enable = true;
#programs.hyprland.withUWSM  = true;
#environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable the kde plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

#zram enable
zramSwap = {
  enable = true;
  algorithm = "zstd";
  # This refers to the uncompressed size, actual memory usage will be lower.
  memoryPercent = 80;
};


services.xserver = {
  enable = true;
  xkb = {
    layout = "us,ara";
    variant = "";
    options = "grp:super_space_toggle";
  };
};

  # Configure keymap in X11
#  services.xserver.xkb = {
#    layout = "us,ara";
#    variant = "";
#  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  services.fwupd.enable = true;

systemd.user.services.setxkbmap = {
  description = "Set keyboard layout for Hyprland";
  serviceConfig = {
    ExecStart = "${pkgs.xorg.setxkbmap}/bin/setxkbmap us,ara -option grp:super_space_toggle";
    RemainAfterExit = true;
  };
  wantedBy = [ "default.target" ];
};


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rida = {
    isNormalUser = true;
    description = "rida";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
thunderbird
neovim
htop
btop
fastfetch
git
nodejs
kitty
wget
uget
gtk3
pulseaudio
lutris
steam
audacity
gimp
obs-studio
inkscape
gcc
zig
discord
localsend
libreoffice
kdePackages.kdenlive
krunner-translator
p7zip
waybar
rofi
zsh
nautilus
gthumb
vlc
mpv
rar
unrar
zip
file-roller
xz
adwaita-icon-theme
cmatrix
grim
tree
spotify
papirus-icon-theme
clock-rs
gvfs
mtpfs
simple-mtpfs
udiskie
usbutils
psmisc
xorg.setxkbmap
libdrm
steam-run
pkgsi686Linux.mesa
pkgsi686Linux.libdrm
    ];
  };

  fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  ];

  # Install firefox.
  programs.firefox.enable = true;

  programs.nix-ld.enable = true;

  programs.appimage = {
 enable = true;
 binfmt = true;
 };

programs.kdeconnect.enable = true;
networking.firewall.allowedTCPPorts = [ 1714 1715 1716 1717 1718 1719 ];
networking.firewall.allowedUDPPorts = [ 1714 1715 1716 1717 1718 1719 ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  adwaita-icon-theme
  hicolor-icon-theme
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];

environment.pathsToLink = [ "/share/icons" "/share/applications" ];

  environment.variables = {
  GSK_RENDERER = "ngl";

};

programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}

