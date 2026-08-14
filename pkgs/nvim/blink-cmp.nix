{ ... }:

{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        fuzzy.implementation = "rust";
        snippets.preset = "luasnip";
        completion = {
          documentation.auto_show = true;
          menu.border = "rounded";
        };
        sources.default = [
          "lsp"
          "path"
          "snippets"
        ]; # removed "buffer" text completion
        sources.providers.lsp.override.get_completions.__raw = /* lua */ ''
          function(original, context, callback)
                        return original:get_completions(context, function(response)
                          if vim.bo.filetype ~= "nix" or response == nil or #response.items > 0 then
                            callback(response)
                            return
                          end

                          response.is_incomplete_forward = true

                          local bufnr = vim.api.nvim_get_current_buf()
                          local changedtick = vim.api.nvim_buf_get_changedtick(bufnr)
                          local cache = require "blink.cmp.sources.lsp.cache"
                          for _, client in ipairs(vim.lsp.get_clients { bufnr = bufnr, name = "nixd" }) do
                            cache.entries[client.id] = nil
                          end

                          callback(response)

                          if vim.b.blink_nixd_retry_tick == changedtick then return end
                          vim.b.blink_nixd_retry_tick = changedtick
                          vim.defer_fn(function()
                            if
                              vim.api.nvim_buf_is_valid(bufnr)
                              and vim.api.nvim_buf_get_changedtick(bufnr) == changedtick
                              and vim.bo.filetype == "nix"
                              and vim.fn.mode():sub(1, 1) == "i"
                            then
                              require("blink.cmp").show { providers = { "lsp" } }
                            end
                          end, 150)
                        end)
                      end
        '';
        keymap.preset = "super-tab";
        signature.enabled = true;
      };
    };
  };
}
