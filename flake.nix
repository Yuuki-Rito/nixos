{
  description = "NixOS configuration with Noctalia";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  
    noctalia.url = "github:noctalia-dev/noctalia-shell";
      
  };

  outputs = inputs@{ 
    self, 
    nixpkgs, 
    home-manager,
    ... 
  }:{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
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
  };
}
