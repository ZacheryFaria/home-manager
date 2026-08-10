{ pkgs, lib, homeDir, ... }:
let
  nvimSource = "${homeDir}/.config/home-manager/dots/nvim";
  extraPackages = with pkgs; [
    # Lua
    lua-language-server
    stylua
    selene

    # TypeScript / JavaScript
    typescript-go
    eslint_d
    prettierd
    graphql-language-service-cli

    # Go
    gopls
    delve
    gotests

    # Rust
    rust-analyzer
    bacon

    # Python
    basedpyright
    ruff
    python3Packages.autopep8
    python3Packages.debugpy

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
in
{
  home.packages = [ pkgs.neovim-unwrapped ] ++ extraPackages;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  home.shellAliases = {
    vim = "nvim";
  };

  # Keep Neovim config writable by linking directly to the repo checkout
  # during activation instead of copying files into the store.
  home.activation.linkRepoBackedNvim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="$HOME/.config/nvim"
    source="${nvimSource}"

    mkdir -p "$HOME/.config"

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
      exit 0
    fi

    if [ -e "$target" ] || [ -L "$target" ]; then
      backup="$HOME/.config/nvim.hm-backup"
      if [ -e "$backup" ] || [ -L "$backup" ]; then
        backup="$HOME/.config/nvim.hm-backup.$(date +%Y%m%d%H%M%S)"
      fi
      mv "$target" "$backup"
    fi

    ln -sfn "$source" "$target"
  '';

  home.activation.nvimSync = lib.hm.dag.entryAfter [ "linkRepoBackedNvim" ] ''
    ${pkgs.neovim-unwrapped}/bin/nvim --headless "+Lazy! restore" "+MasonLockRestore" +qa 2>/dev/null || true
  '';
}
