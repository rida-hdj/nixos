{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "rida";
  home.homeDirectory = "/home/rida";

  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  home.sessionVariables = {
  };
  imports = [
    ./modules/fish.nix
    ./modules/nh.nix
    ./modules/neovim.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    papirus-icon-theme
    nil
    lua-language-server
    bash-language-server
    marksman
    typescript-language-server
    vscode-langservers-extracted
    pyright
    emmet-ls
  ];
}
