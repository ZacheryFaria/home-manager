return {
  "mrcjkb/haskell-tools.nvim",
  version = "^6",
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  dependencies = { "neovim/nvim-lspconfig" },
  init = function()
    vim.g.haskell_tools = {
      hls = {
        on_attach = function(client, bufnr)
          -- Enable formatting
          client.server_capabilities.documentFormattingProvider = true

          -- Refresh codelens on buffer changes
          if client.server_capabilities.codeLensProvider then
            vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
              buffer = bufnr,
              callback = function() vim.lsp.codelens.refresh() end,
            })
          end

          -- -- Add keybinding for running code lens at cursor
          -- vim.keymap.set(
          --   "n",
          --   "<leader>lr",
          --   function() vim.lsp.codelens.run() end,
          --   { noremap = true, silent = true, buffer = bufnr, desc = "Run code lens" }
          -- )
        end,
        default_settings = {
          haskell = {
            formattingProvider = "ormolu",
            plugin = {
              stan = { globalOn = false },
              hlint = { globalOn = true },
              eval = { globalOn = true }, -- For evaluation lenses
              class = { globalOn = true }, -- For instance lenses
              importLens = { globalOn = true }, -- For import lenses
              refineImports = { globalOn = true },
              tactics = { globalOn = true }, -- For typed holes
              pragmas = {
                globalOn = true,
                completionOn = true,
              },
              moduleName = { globalOn = true },
              rename = { globalOn = true },
              retrie = { globalOn = true }, -- For refactoring lenses
            },
          },
        },
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      },
      tools = {
        codeLens = {
          autoRefresh = true,
        },
        hover = {
          enable = true,
        },
      },
    }

    -- Ensure formatting works on save for Haskell files
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.hs", "*.lhs" },
      callback = function() vim.lsp.buf.format { timeout_ms = 2000 } end,
    })
  end,
}
