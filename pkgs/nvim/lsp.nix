{
  homeDir,
  lib,
  pkgs,
  user,
  ...
}:
{

  programs.nixvim = {
    diagnostic.settings = {
      virtual_text = true;
    };
    plugins = {
      trouble.enable = true;
      lsp = {
        enable = true;
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
              key = "<leader>lf";
              action.__raw = "function() vim.diagnostic.open_float() end";
              options.desc = "LSP open float";
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
          # nix
          nil_ls.enable = true;
          nixd = {
            enable = true;
            settings = {
              nixpkgs = {
                # Evaluates your explicit flake inputs to resolve core packages (e.g. pkgs.stdenv)
                expr = "import (builtins.getFlake \"${homeDir}/.config/home-manager\").inputs.nixpkgs { }";
              };
              formatting.command = [ (lib.getExe pkgs.nixfmt) ];
              options = {
                # Deep autocompletion engine for Home Manager modules
                home-manager = {
                  expr = "(builtins.getFlake \"${homeDir}/.config/home-manager\").homeConfigurations.${user}.options";
                };
              };
            };
          };

          # python
          basedpyright.enable = true;
          ruff.enable = true;
          pylsp = {
            enable = true;
            settings.plugins.mypy.enabled = true;
          };

          # ts / js / html
          tsgo.enable = true;
          cssls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          eslint.enable = true;

          # golang
          gopls.enable = true;
          golangci_lint_ls.enable = true;

          # docker
          docker_compose_language_service.enable = true;
          dockerls.enable = true;

          # misc
          nginx_language_server.enable = true;
          yamlls.enable = true;
          lua_ls.enable = true;
        };
      };

    };
  };
}
