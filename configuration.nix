{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  hardware.graphics.enable32Bit = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #Enable plymouth
  boot.plymouth.enable = true;
  boot.initrd.systemd.enable = true;
  boot.plymouth.theme = "bgrt";

  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [
    "quiet"
    "splash"
  ];

  #Kernel version
  boot.kernelPackages = pkgs.linuxPackages;

  #--Enable nixos flakes--
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos";

  #Enable niri
  programs.niri.enable = true;
  xdg.portal.enable = true;

  #Enable noctalia
  services.noctalia-shell.enable = true;

  #Enable fish shell
  users.users.rida.shell = pkgs.fish;
  programs.fish.enable = true;

  #Enable SSH
  services.openssh.enable = true;

  #Enable network manager
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable DE & LM
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = false;

  #Enable zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 80;
  };

  #Enable xserver
  services.xserver = {
    enable = true;
  };

  services.fwupd.enable = true;

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

  users.users.rida = {
    isNormalUser = true;
    description = "rida";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [

      brave
      thunderbird
      libreoffice
      kdePackages.kdenlive
      mpv
      yt-dlp
      cava
      vim
      fzf
      lutris
      pcsx2
      mangohud
      tmux
      htop
      btop
      fastfetch
      git
      aria2
      docker-compose
      fd
      lsd
      tree
      clock-rs
      gnome-calculator
      nodejs
      kitty
      foot
      wget
      jdk21_headless
      ffmpeg
      glibc
      audacity
      obs-studio
      gcc
      clang
      clang-tools
      cmake
      glow
      ripgrep
      discord
      fluffychat
      element-desktop
      cinny
      telegram-desktop
      localsend
      p7zip
      nautilus
      gthumb
      cmatrix
      lazygit
      yazi
      ncdu
      bat
      vicinae
      xwayland-satellite
      alsa-utils
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
      wl-clipboard
      jellyfin-ffmpeg
      noti
      nwg-look
      caligula
      android-tools
      python3
      lzip
    ];
  };

  #Enable nix-ld
  programs.nix-ld.enable = true;

  #Enable appimage
  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  #Enable firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      53317
      25565
      30000
    ];
    allowedUDPPorts = [
      53317
      25565
      30000
    ];
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

  #Enable flatpak
  services.flatpak.enable = true;

  #Enable steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  #Enable jellyfin
  services.jellyfin = {
    enable = false;
    openFirewall = true;
  };

  #Enable docker
  virtualisation.docker = {
    enable = false;
    daemon.settings = {
      "default-address-pools" = [
        {
          base = "172.27.0.0/16";
          size = 24;
        }
      ];
    };
  };

  system.stateVersion = "25.05";

}
