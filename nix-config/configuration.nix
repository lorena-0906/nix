
{ config, pkgs, inputs, ... }:

{
  imports =
    [  
      ./hardware-configuration.nix
      ../modules.nix
  
    ]; 

  nix.settings.trusted-users = ["@wheel"];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.nh = {
       enable = true;
       flake = "/etc/nixos"; 
  };
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "niko-wife"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

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



  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lorena = {
    isNormalUser = true;
    description = "Lorena";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [

    kdePackages.kate
  
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  services.flatpak.enable = true;  

  programs.gamemode.enable = true;

  environment.systemPackages = with pkgs; [
   
  

  ];

  
  services.xserver.videoDrivers = [ "nvidia" ];
   hardware = {
    graphics.enable = true;
    nvidia.open = false;
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.production;
    #nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s p  nix.settings.experimental-features = [ "nix-command" "flakes" ];erfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
