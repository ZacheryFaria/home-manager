-- Keep Mason enabled so AstroNvim's mason-lspconfig / mason-null-ls
-- integration layer works, but don't auto-install anything —
-- all tools are provided by Nix extraPackages on PATH.
return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- Don't add Mason bin to PATH — Nix already provides everything
      PATH = "skip",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {},
      auto_update = false,
      run_on_start = false,
    },
  },
}
