local ht = require('haskell-tools')
local bufnr = vim.api.nvim_get_current_buf()
local opts = function(desc)
  return { noremap = true, silent = true, buffer = bufnr, desc = desc }
end

-- haskell-language-server relies heavily on codeLenses,
-- so auto-refresh is enabled by default
vim.keymap.set("n", "<leader>lhr", vim.lsp.codelens.run, opts("Run code lens"))

-- Hoogle search for the type signature of the definition under the cursor
vim.keymap.set("n", "<leader>lhs", ht.hoogle.hoogle_signature, opts("Hoogle search signature"))

-- Evaluate all code snippets
vim.keymap.set("n", "<leader>lhe", ht.lsp.buf_eval_all, opts("Evaluate all code snippets"))

-- Toggle a GHCi repl for the current package
vim.keymap.set("n", "<leader>lht", ht.repl.toggle, opts("Toggle GHCi for package"))

-- Toggle a GHCi repl for the current buffer
vim.keymap.set("n", "<leader>lhf", function() ht.repl.toggle(vim.api.nvim_buf_get_name(0)) end, opts("Toggle GHCi for buffer"))
vim.keymap.set("n", "<leader>lhq", ht.repl.quit, opts("Quit GHCi"))
