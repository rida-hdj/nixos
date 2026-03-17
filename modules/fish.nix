{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "lsd";
      v = "nvim";
      sv = "sudo -E nvim";
      ff = "fastfetch -c examples/13";
    };
    generateCompletions = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
