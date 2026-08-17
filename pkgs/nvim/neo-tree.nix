{ ... }:
{

  programs.nixvim = {
    globals = {
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    plugins.neo-tree = {
      enable = true;

      settings = {
        event_handlers = [
          {
            event = "neo_tree_buffer_enter";
            handler = {
              __raw = ''
                function()
                  vim.opt_local.number = true
                  vim.opt_local.relativenumber = true
                end
              '';
            };
          }
        ];
        closeIfLastWindow = true;
        sources = [
          "filesystem"
          "buffers"
          "git_status"
          "document_symbols"
        ];
        popupBorderStyle = "rounded"; # “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

        filesystem = {
          bindToCwd = true;
          useLibuvFileWatcher = true;
          followCurrentFile.enabled = true;
          hijackNetrwBehavior = "open_current";
        };

        defaultComponentConfigs = {
          gitStatus = {
            symbols = {
              added = "✚";
              modified = "";
              deleted = "✖";
              untracked = "";
            };
          };
        };

        window.mappings = {
          "<space>" = "none";
          "l" = "open";
          "h" = "close_node";
        };
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
      {
        mode = "n";
        key = "<leader>o";
        action.__raw = /* lua */ ''
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.wincmd "p"
            else
              vim.cmd.Neotree "focus"
            end
          end
        '';
        options = {
          silent = true;
          desc = "Explorer NeoTree (root dir)";
        };
      }
      {
        mode = "n";
        key = "<leader>nr";
        action = "<cmd>Neotree reveal<cr>";
        options = {
          silent = true;
          desc = "NeoTree Reveal";
        };
      }
      {
        mode = "n";
        key = "<leader>nf";
        action = "<cmd>Neotree float<cr>";
        options = {
          silent = true;
          desc = "NeoTree float";
        };
      }
    ];
  };

}
