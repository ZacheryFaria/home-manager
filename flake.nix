{
  description = "Home Manager configuration of zach";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    claude-code.url = "github:sadjow/claude-code-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      claude-code,
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
          claude-code = claude-code;
        };
      };

      homeConfigurations."zfaria" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        modules = [ ./work.nix ];

        extraSpecialArgs = {
          user = "zfaria";
          homeDir = "/Users/zfaria";
        };
      };

      homeConfigurations."fedora" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [ ./common.nix ];

        extraSpecialArgs = {
          user = "zach";
          homeDir = "/home/zach";
        };
      };
    };
}
