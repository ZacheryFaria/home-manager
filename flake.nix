{
  description = "Home Manager configuration of zach";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-neovim.url = "github:nixos/nixpkgs/4684fd6b0c01e4b7d99027a34c93c2e09ecafee2";
    claude-code.url = "github:sadjow/claude-code-nix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-neovim,
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
          neovim-pin = nixpkgs-neovim.legacyPackages.aarch64-darwin;
        };
      };

      homeConfigurations."zfaria" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;

        modules = [ ./work.nix ];

        extraSpecialArgs = {
          user = "zfaria";
          homeDir = "/Users/zfaria";
          neovim-pin = nixpkgs-neovim.legacyPackages.aarch64-darwin;
        };
      };

      homeConfigurations."fedora" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [ ./common.nix ];

        extraSpecialArgs = {
          user = "zach";
          homeDir = "/home/zach";
          neovim-pin = nixpkgs-neovim.legacyPackages.x86_64-linux;
        };
      };
    };
}
