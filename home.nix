{ config, pkgs, ... }:

{
  home.username = "rida";
  home.homeDirectory = "/home/rida";

  home.stateVersion = "25.11";
  
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
  #...
  ];
}
