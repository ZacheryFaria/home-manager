{
  ...
}:

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
        lazygit.enable = true;
        which-key.enable = true;
        nvim-autopairs.enable = true;

        ts-autotag.enable = true;
        ts-comments.enable = true;
        treesitter = {
          enable = true;
          highlight.enable = true;
          indent.enable = true;
          autoLoad = true;
        };
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
        {
          mode = "n";
          key = "<leader>gg";
          action = "<cmd>LazyGit<cr>";
          options = {
            desc = "Lazy Git Open";
          };
        }
        {
          mode = "n";
          key = "<leader>gc";
          action = "<cmd>LazyGitFilterCurrentFile<cr>";
          options = {
            desc = "Lazy Git Filter Current File";
          };
        }
        {
          mode = "n";
          key = "<leader>gf";
          action = "<cmd>LazyGitFilter<cr>";
          options = {
            desc = "Lazy Git Filter";
          };
        }
      ];

    };
  };
}
