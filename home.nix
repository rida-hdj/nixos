{
  pkgs,
  ...
}:

{
  home.username = "rida";
  home.homeDirectory = "/home/rida";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
  home.sessionVariables = {
  };
  imports = [

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
