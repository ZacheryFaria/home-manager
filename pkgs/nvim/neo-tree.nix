{ ... }:
{

  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      #lazyLoad.settings.cmd = [ "Neotree" ];

      # eventHandlers.__raw = {
      #   neo_tree_buffer_enter = /* lua */ ''
      #     function()
      #       vim.opt_local.number = true
      #       vim.opt_local.relativenumber = true
      #     end
      #   '';
      # };
      settings = {
        closeIfLastWindow = true;
        sources = [
          "filesystem"
          "buffers"
          "git_status"
          "document_symbols"
        ];
        popupBorderStyle = "rounded"; # “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code

        filesystem = {
          bindToCwd = false;
          useLibuvFileWatcher = true;
          followCurrentFile.enabled = true;
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
