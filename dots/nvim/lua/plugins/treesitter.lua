-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "typescript",
      "tsx",
      -- add more arguments for adding more treesitter parsers
    },
    indent = {
      enabled = true,
    },
  },
}
