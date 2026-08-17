{ ... }:
{

  programs.nixvim = {
    plugins.telescope.enable = true;

    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options = {
          desc = "Search for file (find_files)";
        };
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options = {
          desc = "Grep files (live_grep)";
        };
      }
    ];
  };

}
