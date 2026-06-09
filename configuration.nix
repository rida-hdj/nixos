{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

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

  #--Enable nixos flakes--
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = "nixos";

  #Enable niri
  programs.niri.enable = true;

  #Enable kde
  services.desktopManager.plasma6 = {
    enable = false;
  };

  #Enable kde connect
  programs.kdeconnect.enable = true;

  #Enable fish shell
  users.users.rida.shell = pkgs.fish;
  programs.fish.enable = true;
  users.motd = "";
  users.motdFile = null;

  security.pam.services.sshd.showMotd = lib.mkForce false;

  #Enable SSH
  services.openssh = {
    enable = true;
  };

  #Enable network manager
  networking.networkmanager.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  #Enable tailscale
  services.tailscale.enable = true;

  # Set your time zone
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable DM
  services.displayManager.ly.enable = true;

  #Enable zram
  zramSwap = {
    enable = false;
    algorithm = "zstd";
    memoryPercent = 80;
  };

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

  users.users.rida = {
    isNormalUser = true;
    description = "rida";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "input"
    ];
    packages = with pkgs; [

      brave
      thunderbird
      drawy
      foliate
      adw-gtk3
      kdePackages.kdenlive
      #mpv
      celluloid
      vlc
      cava
      vim
      zed-editor
      fzf
      pcsx2
      mangohud
      tmux
      htop
      btop
      fastfetch
      git
      aria2
      ethtool
      opencode
      docker-compose
      fd
      lsd
      tree
      clock-rs
      gnome-calculator
      nodejs
      kitty
      luajitPackages.magick
      lua
      foot
      ghostty
      wezterm
      wget
      jdk21_headless
      ffmpeg
      glibc
      audacity
      obs-studio
      oklch-color-picker
      inkscape
      gcc
      clang
      clang-tools
      cmake
      glow
      ripgrep
      discord
      localsend
      p7zip
      nautilus
      gnome-clocks
      gthumb
      cmatrix
      lazygit
      yazi
      ncdu
      dysk
      lsof
      bat
      vicinae
      xwayland-satellite
      alsa-utils
      wireplumber
      wl-clipboard
      jellyfin-ffmpeg
      noti
      nwg-look
      caligula
      android-tools
      python3
      lzip
      wineWow64Packages.waylandFull
      nftables
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xclicker
      noctalia-shell
      onlyoffice-desktopeditors
      keepassxc
      tailscale
      blanket
      krita
      fast-cli-zig
      typer
      ttyper
      tt
      toipe
      smassh
      typioca
      typtea
      kdePackages.marknote
      bookup
      mkdocs
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
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

  #Enable firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      53317
      25565
      30000
      80
      443
      22
    ];
    allowedUDPPorts = [
      53317
      25565
      30000
    ];
  };

  #Enable docker
  virtualisation.docker = {
    enable = true;
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
