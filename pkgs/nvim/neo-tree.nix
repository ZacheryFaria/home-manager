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
        openFilesDoNotReplaceTypes = [
          "terminal"
          "Trouble"
          "trouble"
          "qf" # Quickfix windows
        ];
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
          hijackNetrwBehavior = "open_default";
          followCurrentFile = {
            enabled = true; # This automatically reveals the file if the tree is open
            leaveDirsOpen = false; # Optional: closes other folders when switching files
          };
        };

        buffers = {
          followCurrentFile = {
            enabled = true;
          };
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
          "q" = "close_window";
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
              vim.cmd "Neotree reveal"
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
