{
  ...
}:

{
  imports = [
    ./blink-cmp.nix
    ./lsp.nix
    ./conform.nix
    ./neo-tree.nix
  ];

  programs = {
    nixvim = {
      enable = true;
      globals.mapleader = " ";
      colorschemes.catppuccin.enable = true;

      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers
        shiftwidth = 2; # Tab width should be 2
      };

      plugins = {
        lualine.enable = true;
        luasnip.enable = true;
        nix.enable = true;
        treesitter.enable = true;
      };
    };
  };
}
