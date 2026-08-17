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
        which-key.enable = true;
        nix.enable = true;
        treesitter.enable = true;
        telescope.enable = true;
      };

      keymaps = [
        {
          mode = "n";
          key = "<C-h>";
          action = "<C-w>h";
          options = {
            desc = "Go to left window";
          };
        }
        {
          mode = "n";
          key = "<C-j>";
          action = "<C-w>j";
          options = {
            desc = "Go to lower window";
          };
        }
        {
          mode = "n";
          key = "<C-k>";
          action = "<C-w>k";
          options = {
            desc = "Go to upper window";
          };
        }
        {
          mode = "n";
          key = "<C-l>";
          action = "<C-w>l";
          options = {
            desc = "Go to right window";
          };
        }

        # Optional: Fixes potential Ctrl+h conflict with Backspace in some terminals
        {
          mode = "n";
          key = "<BS>";
          action = "<C-w>h";
          options = {
            desc = "Go to left window (Backspace fallback)";
          };
        }
      ];

    };
  };
}
