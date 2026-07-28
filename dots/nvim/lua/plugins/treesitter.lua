-- Customize Treesitter
--
-- As of AstroNvim v6, `nvim-treesitter` tracks its `main` branch, which dropped
-- the `nvim-treesitter.configs` module. Parser installation and the
-- highlight/indent/textobject features are now configured through AstroCore's
-- `treesitter` opts instead of on the plugin spec itself.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      indent = true,
      ensure_installed = {
        "lua",
        "vim",
        "typescript",
        "tsx",
        -- add more arguments for adding more treesitter parsers
      },
    },
  },
}
