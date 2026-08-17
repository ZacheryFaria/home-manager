{
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

    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>BufferLinePick<cr>";
      options = {
        desc = "Pick Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>bc";
      action = "<cmd>bd<cr>";
      options = {
        desc = "Close buffer";
      };
    }

  ];
}
