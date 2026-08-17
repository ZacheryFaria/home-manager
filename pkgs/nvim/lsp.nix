{ ... }:
{

  programs.nixvim = {

    plugins = {
      lsp = {
        enable = true;
        #codelens = true;
        inlayHints = true;
        keymaps = {
          extra = [
            {
              mode = "n";
              key = "<leader>li";
              action = "<cmd>LspInfo<cr>";
              options.desc = "Show LSP info";
            }
            {
              mode = "n";
              key = "<leader>ll";
              action.__raw = "function() vim.lsp.codelens.refresh() end";
              options.desc = "LSP CodeLens refresh";
            }
            {
              mode = "n";
              key = "<leader>lL";
              action.__raw = "function() vim.lsp.codelens.run() end";
              options.desc = "LSP CodeLens run";
            }
          ];

          lspBuf = {
            "<leader>la" = {
              action = "code_action";
              desc = "LSP code action";
            };

            gd = {
              action = "definition";
              desc = "Go to definition";
            };

            gI = {
              action = "implementation";
              desc = "Go to implementation";
            };

            gy = {
              action = "type_definition";
              desc = "Go to type definition";
            };

            K = {
              action = "hover";
              desc = "LSP hover";
            };
          };
        };
        servers = {
          nil_ls.enable = true;
          nixd.enable = true;

          # python
          basedpyright.enable = true;
          ruff.enable = true;
          tsgo.enable = true;
          pylsp = {
            enable = true;
            settings.plugins.mypy.enabled = true;
          };
          cssls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          eslint.enable = true;
          lua_ls.enable = true;
          nginx_language_server.enable = true;
          yamlls.enable = true;
        };
      };

    };
  };
}
