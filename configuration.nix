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

  #enable plymouth
  boot.plymouth.enable = true;

  boot.initrd.systemd.enable = true;

  boot.plymouth.theme = "bgrt";

  boot.initrd.verbose = false;
  boot.consoleLogLevel = 0;
  boot.kernelParams = [ "quiet" "splash" ];

  #kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  #--enable nixos flakes--
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  
  #enable niri
  programs.niri.enable = true;
  xdg.portal.enable = true;

  #enable noctalia
  services.noctalia-shell.enable = true;

  #enable fish shell
  users.users.rida.shell = pkgs.fish;
  programs.fish.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Casablanca";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable DE & LM
  services.displayManager.ly.enable = true;
  services.desktopManager.plasma6.enable = true;

#zram enable
zramSwap = {
  enable = true;
  algorithm = "zstd";
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
  };
  
  users.users.rida = {
    isNormalUser = true;
    description = "rida";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

librewolf
brave
thunderbird
libreoffice
nerd-fonts.jetbrains-mono
neovim
neovide
helix
vscodium
tmux
starship
htop
btop
fastfetch
git
fd
lsd
clock-rs
gnome-calculator
nodejs
lua-language-server
pyright
rust-analyzer
nodePackages.vscode-langservers-extracted
nodePackages.typescript-language-server
kitty
wget
uget
gtk3
nerd-fonts.noto
pulseaudio
lutris
prismlauncher
ffmpeg
steam
audacity
gimp
obs-studio
inkscape
gcc
clang
clang-tools
bear
glibc
cmake
ninja
zig
glow
ripgrep
discord
localsend
kdePackages.kdenlive
p7zip
nautilus
gthumb
nerd-fonts.fira-code
cmatrix
lazygit
yazi
termusic
ncdu
networkmanager
bat
vicinae
adwaita-icon-theme
xwayland-satellite
alsa-utils
xdg-desktop-portal-gnome
xdg-desktop-portal-gtk
wl-clipboard-x11
wl-clipboard
#jellyfin-media-player
jellyfin-ffmpeg
];
};
  # Install firefox.
  programs.firefox.enable = true;
  programs.nix-ld.enable = true;
  #enable appimage.
  programs.appimage = {
 enable = true;
 binfmt = true;
 };

  #enable kde connect.
programs.kdeconnect.enable = true;
networking.firewall.allowedTCPPorts = [ 1714 1715 1716 1717 1718 1719 ];
networking.firewall.allowedUDPPorts = [ 1714 1715 1716 1717 1718 1719 ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  ];

environment.pathsToLink = [ "/share/icons" "/share/applications" ];

  environment.variables = {
  GSK_RENDERER = "ngl";

};
  #enable steam
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true; 
  localNetworkGameTransfers.openFirewall = true; 
};

  #enable jellyfin
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };
  systemd.services.jellyfin.wantedBy = [];

  system.stateVersion = "25.05";

}
