{
  description = "NixOS configuration with Noctalia";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  
    noctalia.url = "github:noctalia-dev/noctalia-shell";
      
  };

  outputs = inputs@{ 
    self, 
    nixpkgs, 
    ... 
  }:{
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };

      modules = [
        ./nixos/configuration.nix
        ./modules
      ] ;
    };
  };
}
