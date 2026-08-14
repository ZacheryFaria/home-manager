{
  ...
}:

{
  imports = [
    ./blink-cmp.nix
    ./lsp.nix
    ./conform.nix
  ];

  programs = {
    nixvim = {
      enable = true;
      globals.mapleader = " ";

      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers
        shiftwidth = 2; # Tab width should be 2
      };

      colorschemes.catppuccin.enable = true;
      plugins = {
        neo-tree.enable = true;
        lualine.enable = true;
        luasnip.enable = true;
        nix.enable = true;
        treesitter.enable = true;
      };
    };
  };
}
