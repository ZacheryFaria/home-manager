{ pkgs, config, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      # Lua
      lua-language-server
      stylua

      # TypeScript / JavaScript
      vtsls
      eslint_d
      prettierd

      # Go
      gopls
      delve

      # Rust
      rust-analyzer

      # Python
      basedpyright
      ruff
      python3Packages.debugpy

      # Haskell
      haskell-language-server
      ormolu

      # Nix
      nixd

      # YAML / Shell / Docker
      yamllint
      yaml-language-server
      shellcheck
      nodePackages.dockerfile-language-server-nodejs
      vscode-langservers-extracted # css, html, json LSPs

      # Treesitter
      tree-sitter
    ];
  };

  # Symlink directly to the source directory (not through Nix store)
  # so lazy-lock.json remains writable
  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "/Users/zfaria/.config/home-manager/dots/nvim";
}
