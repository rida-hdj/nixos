{ config, pkgs, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/etc/nixos";
    homeFlake = "/etc/nixos";
    osFlake = "/etc/nixos";
  };
}
