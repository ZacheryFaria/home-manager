{ ... }:
{

  programs.nixvim = {
    # hack to get neo-tree to close when it is last buffer
    autoCmd = [
      {
        event = [ "BufEnter" ];
        pattern = [ "*" ];
        nested = true;
        callback.__raw = /* lua */ ''
          function()
            if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "neo-tree" then
              vim.schedule(function()
                vim.cmd("quit!")
              end)
            end
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
        eventHandlers = {
          neo_tree_buffer_enter.__raw = /* lua */ ''
            function()
              vim.opt_local.number = true
              vim.opt_local.relativenumber = true
            end
          '';
        };
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
