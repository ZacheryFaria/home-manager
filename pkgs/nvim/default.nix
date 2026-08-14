# packages shared across all machines
{
  pkgs,
  user,
  homeDir,
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
      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers
        shiftwidth = 2; # Tab width should be 2
      };

      colorschemes.catppuccin.enable = true;
      plugins = {
        lualine.enable = true;
        luasnip.enable = true;
        nix.enable = true;
        treesitter.enable = true;
      };
    };
  };
}
