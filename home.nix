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
    ./modules/nh.nix
  ];

  home.packages = with pkgs; [
    papirus-icon-theme
    nil
    lua-language-server
    bash-language-server
    marksman
    typescript-language-server
    vscode-langservers-extracted
    pyright
    rust-analyzer
    tree-sitter
    luarocks
    cargo
    rustc
    rustfmt
    mdbook
    neovim
    imagemagick
  ];
}
