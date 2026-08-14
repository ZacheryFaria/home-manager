{
  description = "Home Manager configuration of zach";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixvim,
      home-manager,
      ...
    }:
    {
      homeConfigurations."zach" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          user = "zach";
          homeDir = "/Users/zach";
        };
      };

      homeConfigurations."zfaria" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        modules = [
          ./work.nix
          nixvim.homeModules.nixvim
        ];

        extraSpecialArgs = {
          user = "zfaria";
          homeDir = "/Users/zfaria";
        };
      };

      homeConfigurations."linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [ ./linux.nix ];

        extraSpecialArgs = {
          user = "zach";
          homeDir = "/home/zach";
        };
      };

    };
}
