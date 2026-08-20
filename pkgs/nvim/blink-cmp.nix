{ ... }:

{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        completion = {
          list = {
            maxItems = 200;
          };
          documentation.auto_show = true;
          menu = {
            # Automatically hides identical completion strings provided by overlapping LSPs
            border = "rounded";
            autoShow = true;
            draw = {
              columns = [
                [ "kind_icon" ]
                [
                  "label"
                  "label_description"
                ]
              ];
            };
          };
        };
        fuzzy.implementation = "rust";
        snippets.preset = "luasnip";
        sources.default = [
          "lsp"
          "path"
          "snippets"
        ];
        sources.providers.lsp.override.get_completions.__raw = builtins.readFile ./nix-completions.lua;
        keymap.preset = "super-tab";
        signature.enabled = true;
      };
    };
  };
}
