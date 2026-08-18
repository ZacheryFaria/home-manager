{ pkgs, ... }:
{

  programs.nixvim = {
    plugins.fzf-lua = {
      enable = true;

      settings = {
        winopts.preview.default = "bat";
      };

      keymaps = {
        "<leader><space>" = "files";
        "<leader>ff" = "files";
        "<leader>fg" = "live_grep";
        "<leader>fw" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
    };
  };
}
