{ ... }:

{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        fuzzy.implementation = "rust";
        snippets.preset = "luasnip";
        completion = {
          documentation.auto_show = true;
          menu.border = "rounded";
        };
        sources.default = [
          "lsp"
          "path"
          "snippets"
        ];
        sources.providers.lsp.override.get_completions.__raw =
          builtins.readFile ./nix-completions.lua;
        keymap.preset = "super-tab";
        signature.enabled = true;
      };
    };
  };
}
