return {
  "ZacheryFaria/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Set the environment variable for directory change
    vim.env.LAZYGIT_NEW_DIR_FILE = vim.fn.expand "~/.lazygit/newdir"

    -- Create a function that wraps the lazygit call and refreshes neo-tree
    local function lazygit_with_dir_change()
      require("lazygit").lazygit()

      -- Create an autocommand to refresh neo-tree after terminal job is done
      vim.api.nvim_create_autocmd("TermClose", {
        pattern = "*",
        callback = function()
          -- Refresh neo-tree to reflect the new working directory
          if pcall(require, "neo-tree.command") then require("neo-tree.command").execute { action = "refresh" } end
        end,
        once = true, -- Remove the autocommand after it runs
      })
    end

    -- Set up the user command
    vim.api.nvim_create_user_command("LazyGitWithDirChange", lazygit_with_dir_change, {})

    -- Set up a keybinding (optional, adjust as needed)
    vim.keymap.set("n", "<leader>gg", lazygit_with_dir_change, { desc = "LazyGit (with dir change)" })
  end,
}
