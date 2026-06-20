{
  pkgs,
  ...
}:

{

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
      python314Packages.pip
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
      obsidian
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  #Enable fish shell
  users.users.rida.shell = pkgs.fish;
  programs.fish.enable = true;
  users.motd = "";
  users.motdFile = null;

}
