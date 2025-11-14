# home.nix by Deive
{pkgs, config, ...}: {

# imports = [ ];

  home.username = "lorena";
  home.homeDirectory = "/home/lorena";

  home.packages = with pkgs; [ 
  #terminal

  fish

  #games

  osu-lazer-bin
  gamemode
  
  ];

  programs.home-manager.enable = true;
  programs.bash.enable = true;
  nixpkgs.config.allowUnfree = true;

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.11";
}