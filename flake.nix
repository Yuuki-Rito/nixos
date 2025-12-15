{
  description = "NixOS configuration with Noctalia";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    vicinae.url = "github:vicinaehq/vicinae"; # tell Nixos where to get Vicinae
  };

  outputs = inputs@{ 
    self, 
    nixpkgs, 
    home-manager,
    vicinae,
    ... 
  }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      # system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        ./nixos/configuration.nix
        ./modules
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs =  { inherit inputs; };
          home-manager.users.lazycat = import ./home-manager/home.nix;
        }
      ] ;
    };

    homeConfigurations.lazycat = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        vicinae.homeManagerModules.default # enable Home Manager
      ];
    };
  };
}
