{
  nixConfig = {
    extra-substituters = ["https://nix-gaming.cachix.org/"];
    extra-trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    #gaming
    nix-gaming.url = "github:fufexan/nix-gaming";
    #unstable
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, ... }: {
   nixosConfigurations = {
       #hostname
      "niko-wife" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
        
          ./configuration.nix 
        ];
      };
    };
  };
}  