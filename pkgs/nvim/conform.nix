{ ... }:

{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeout_ms = 3000;
          lsp_format = "fallback";
        };

        formatters_by_ft =
          let
            javascriptFormatters = [
              "eslint_d"
              "prettierd"
            ];
          in
          {
            nix = [ "nixfmt" ];
            javascript = javascriptFormatters;
            typescript = javascriptFormatters;
            javascriptreact = javascriptFormatters;
            typescriptreact = javascriptFormatters;
            css = [ "prettierd" ];
            scss = [ "prettierd" ];
            "*" = [ "codespell" ];
            "_" = [ "trim_whitespace" ];
          };
      };
    };
  };
}
