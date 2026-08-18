{ ... }:
{

  programs.nixvim = {
    plugins.fzf-lua = {
      enable = true;

      # Loads the default keymaps for finding files, buffers, etc.
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
