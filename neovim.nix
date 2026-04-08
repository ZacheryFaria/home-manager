{ pkgs, config, homeDir, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # Lua
      lua-language-server
      stylua
      selene

      # TypeScript / JavaScript
      vtsls
      eslint_d
      prettierd
      graphql-language-service-cli

      # Go
      gopls
      delve
      gotools # goimports
      gotests


      # Rust
      rust-analyzer
      bacon

      # Python
      basedpyright
      ruff
      python3Packages.autopep8
      python3Packages.debugpy

      # Haskell
      haskell-language-server
      ormolu

      # Nix
      nixd
      nil # nil LSP (rnix-lsp successor)

      # YAML / Shell / Docker
      yamllint
      yamlfmt
      yaml-language-server
      shellcheck
      dockerfile-language-server
      docker-compose-language-service
      vscode-langservers-extracted # css, html, json LSPs

      # Protobuf
      buf

      # Treesitter
      tree-sitter
    ];
  };

  # Symlink directly to the source directory (not through Nix store)
  # so lazy-lock.json remains writable
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${homeDir}/.config/home-manager/dots/nvim";
}
