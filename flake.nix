{
  description = "Home Manager configuration of zach";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";

    gruvbox-material-ghostty = {
      url = "github:ZacheryFaria/gruvbox-material-ghostty";
      flake = false;
    };

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
      gruvbox-material-ghostty,
      ...
    }:
    {
      homeConfigurations."zach" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./darwin.nix
          nixvim.homeModules.nixvim
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          user = "zach";
          homeDir = "/Users/zach";
          inherit gruvbox-material-ghostty;
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
          inherit gruvbox-material-ghostty;
        };
      };

      homeConfigurations."linux" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
          ./linux.nix
          nixvim.homeModules.nixvim
        ];

        extraSpecialArgs = {
          user = "zach";
          homeDir = "/home/zach";
        };
      };
    };
}
