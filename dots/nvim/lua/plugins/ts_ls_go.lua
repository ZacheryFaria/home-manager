if not vim.g.ts_go_ls then return {} end

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = function(plugin, opts)
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "ts_go_ls")

    -- extend our configuration table to have our new prolog server
    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      -- this must be a function to get access to the `lspconfig` module
      ts_go_ls = {
        -- the command for starting the server
        cmd = {
          "tsgo",
          "--lsp",
          "--stdio",
        },
        -- the filetypes to attach the server to
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        -- root directory detection for detecting the project root
        root_dir = require("lspconfig.util").root_pattern ".git",
      },
    })
  end,
}
