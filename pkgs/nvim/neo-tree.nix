{ ... }:
{

  programs.nixvim = {
    # hack to get neo-tree to close when it is last buffer
    autoCmd = [
      {
        event = [
          "BufEnter"
          "WinClosed"
          "QuitPre"
        ];
        pattern = [ "*" ];
        nested = true;
        callback.__raw = /* lua */ ''
          function()
              vim.schedule(function()
                -- Get all valid, open windows in the current tab
                local wins = vim.api.nvim_tabpage_list_wins(0)

                if #wins == 1 then
                  local buf = vim.api.nvim_win_get_buf(wins[1])
                  local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })

                  -- If Neo-tree is the last window remaining, quit Neovim
                  if ft == "neo-tree" then
                    vim.cmd("qa")
                  end
                end
              end)
            end
        '';
      }
    ];

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
          hijackNetrwBehavior = "open_default";
        };

        defaultComponentConfigs = {
          gitStatus = {
            symbols = {
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
        action = "<cmd>Neotree focus<cr>";
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
