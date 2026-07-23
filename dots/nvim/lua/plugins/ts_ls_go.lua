---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = function(plugin, opts)
    opts.servers = opts.servers or {}
    table.insert(opts.servers, "ts_go_ls")

    opts.config = require("astrocore").extend_tbl(opts.config or {}, {
      ts_go_ls = {
        cmd = {
          "tsgo",
          "--lsp",
          "--stdio",
        },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        root_dir = require("lspconfig.util").root_pattern("tsconfig.json", "package.json", ".git"),
      },
    })
  end,
}
