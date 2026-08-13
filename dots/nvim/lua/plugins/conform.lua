return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      nix = { "nixfmt" },
      nginx = { "nginxfmt" },
      lua = { "stylua" },
      python = { "ruff_format" },
      yaml = { "yamlfmt" },
      proto = { "buf" },
    },
  },
}
