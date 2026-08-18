{ ... }:
{

  programs.nixvim = {
    globals = {
      loaded_netrw = 1;
      loaded_netrwPlugin = 1;
    };

    autoCmd = [
      {
        event = [ "BufEnter" ];
        callback.__raw = ''
          function()
            if vim.bo.filetype == "neo-tree" or vim.bo.buftype ~= "" then
              return
            end
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].filetype == "neo-tree" then
                vim.schedule(function()
                  local cur_win = vim.api.nvim_get_current_win()
                  vim.cmd("Neotree reveal")
                  vim.api.nvim_set_current_win(cur_win)
                end)
                return
              end
            end
          end
        '';
      }
    ];

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
        enableGitStatus = true;
        sources = [
          "filesystem"
          "buffers"
          "git_status"
          "document_symbols"
        ];
        source_selector = {
          winbar = true;
        };
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
              added = ""; # Clean Git Plus/Added icon (Codepoint: u+f457)
              modified = ""; # The standard modified dot you can see
              deleted = ""; # Clean Git Minus/Removed icon (Codepoint: u+f458)
              untracked = ""; # Clean question mark
              renamed = "➜"; # Clean arrow
              unstaged = "✗"; # Swaps empty checkbox square to an 'X'
              staged = "✓"; # Swaps filled checkbox square to a checkmark
              conflict = "";
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
