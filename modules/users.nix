{
  pkgs,
  ...
}:

{

  users.users.your-username = {
    isNormalUser = true;
    description = "your-username";
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
      luajitPackages.magick
      lua
      foot
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
      gnumake
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
      python314Packages.pip
      lzip
      wineWow64Packages.waylandFull
      nftables
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xclicker
      noctalia
      onlyoffice-desktopeditors
      keepassxc
      tailscale
      blanket
      krita
      fast-cli-zig
      mkdocs
      wooz
      pkg-config
      alsa-lib
      obsidian
      newsflash
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  #Enable fish shell
  users.users.your-username.shell = pkgs.fish;
  programs.fish.enable = true;
  users.motd = "";
  users.motdFile = null;

}
