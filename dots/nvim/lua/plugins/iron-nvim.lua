return {
  "Vigemus/iron.nvim",
  config = function()
    require("iron.core").setup {
      -- Your configuration goes here.
      -- iron.nvim automatically detects haskell (ghci) command.
      config = {
        repl_definition = {
          haskell = {
            command = function(meta)
              -- local file = vim.api.nvim_buf_get_name(meta.current_bufnr)
              -- call `require` in case iron is set up before haskell-tools
              -- return require("haskell-tools").repl.mk_repl_cmd(file)
              return "ghci"
            end,
          },
        },
        repl_open_cmd = require("iron.view").bottom(20),
      },
      keymaps = {
        send_motion = "<space>lis",
      },
    }
  end,
}
