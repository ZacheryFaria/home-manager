-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
--

vim.keymap.set("n", "<Leader>ln", function()
  local filepath = vim.fn.expand "%:p"
  local dir, name = filepath:match "/([ap][pk][pg]s)/([^/]+)/"
  if not dir then
    vim.notify("Could not infer app/pkg from current file path", vim.log.levels.WARN)
    return
  end
  local cmd = "bazel run //" .. dir .. "/" .. name .. ":l10n_lockfile_fix"
  vim.notify("Running: " .. cmd)
  vim.cmd("tabnew | terminal " .. cmd)
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_create_autocmd("TermClose", {
    buffer = bufnr,
    once = true,
    callback = function()
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(bufnr) then
          vim.cmd("tabclose")
        end
      end, 1500)
    end,
  })
end, { desc = "Run l10n lockfile fix for current app/pkg" })
