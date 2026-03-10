--https://cmp.saghen.dev/

return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  opts = {
    sources = {
      providers = {
        buffer = { score_offset = 3 },
        lsp = { score_offset = 5, async = true },
        path = { score_offset = 1, async = true },
        snippets = { score_offset = -1, async = true },
      },
    },
    completion = { menu = { auto_show = true } },
    fuzzy = { implementation = "rust" },
    -- something else is rendering the signatures
    signature = { enabled = false },
  },
}
