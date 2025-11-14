{  config, pkgs,  ... }: {

    environment.systemPackages = with pkgs; [
     
  #terminal

  nano
  fastfetch
  htop
  tree 
  cava
  fish

  #audio

  spotify
  audacious

  #games
 
  lutris
  heroic
  wine

  #video

  obs-studio
  vlc

  #chat
    
  vesktop 

  #tools

  git 
  wget
  unzip
  zenity
  xdg-desktop-portal-gtk
  gparted
  github-cli
  github-desktop
  
  #editor

  vscodium
  direnv

     
    ];
}
  

