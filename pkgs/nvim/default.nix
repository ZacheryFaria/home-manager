{
  ...
}:

let
  keymaps = import ./keymaps.nix;
in
{
  imports = [
    ./blink-cmp.nix
    ./lsp.nix
    ./conform.nix
    ./neo-tree.nix
    ./telescope.nix
  ];

  programs = {
    nixvim = {
      keymaps = keymaps.keymaps;

      enable = true;
      globals.mapleader = " ";

      colorschemes.gruvbox = {
        enable = true;
      };

      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers
        shiftwidth = 2; # Tab width should be 2
      };

      plugins = {
        bufferline.enable = true;
        luasnip.enable = true;
        lualine.enable = true;
        nix.enable = true;
        lazygit.enable = true;
        which-key.enable = true;
        nvim-autopairs.enable = true;
        rainbow.enable = true;

        ts-autotag.enable = true;
        ts-comments.enable = true;
        treesitter = {
          enable = true;
          highlight.enable = true;
          indent.enable = true;
          autoLoad = true;
        };
      };
    };
  };
}
