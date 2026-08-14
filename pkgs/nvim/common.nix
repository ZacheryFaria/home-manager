# packages shared across all machines
{
  pkgs,
  user,
  homeDir,
  ...
}:

{
  programs = {
    # Let Home Manager install and manage itself.
    home-manager = {
      enable = true;
    };
    zsh = {
      enable = true;
      initContent = ''
        eval "$(direnv hook zsh)"
        bindkey -e
        bindkey '^[[1;3D' backward-word   # Alt/Option + Left Arrow
        bindkey '^[[1;3C' forward-word    # Alt/Option + Right Arrow

        [[ $- == *i* ]] && [ -z "$DISABLE_ZOXIDE" ] && eval "$(zoxide init --cmd cd zsh)"
      '';

      plugins = [
        {
          name = "pure";
          src = pkgs.fetchFromGitHub {
            owner = "sindresorhus";
            repo = "pure";
            rev = "v1.27.1"; # Use the latest version tag
            sha256 = "1619389e554f4b4f688747282ec0678eb2a7710184e9c504ca7cc33b64a48aaf";
          };
        }
      ];
    };

    git = {
      enable = true;

      settings = {
        user.name = "Zachery Faria";
        user.email = "zacheryfaria@gmail.com";
        push.autoSetupRemote = true;
        alias = {
          ci = "commit";
          co = "checkout";
          s = "status -sb";
          lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
        };
      };
    };

    fzf = {
      enable = true;
      enableNushellIntegration = false;
    };

    nixvim = {
      enable = true;
      opts = {
        number = true; # Show line numbers
        relativenumber = true; # Show relative line numbers

        shiftwidth = 2; # Tab width should be 2
      };

      colorschemes.catppuccin.enable = true;
      plugins = {
        lualine.enable = true;
        luasnip.enable = true;
        conform-nvim = {
          enable = true;
          settings = {
            format_on_save = {
              timeout_ms = 500;
              lsp_format = "fallback";
            };
          };
        };

        nix.enable = true;
        treesitter.enable = true;

        lsp = {
          #inlayHints.enable = true;:
          enable = true;

          servers = {
            nixd.enable = true;
          };
        };
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
    };

  };

  nixpkgs.config = {
    allowUnfree = true;
  };

}
