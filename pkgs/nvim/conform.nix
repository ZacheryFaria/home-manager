{ ... }:

{
  programs.nixvim.plugins = {
    conform-nvim = {
      enable = true;
      settings = {
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };

        formatters_by_ft =
          let
            javascriptFormatters = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              stop_after_first = true;
            };
          in
          {
            nix = [ "nixfmt" ];
            javascript = javascriptFormatters;
            typescript = javascriptFormatters;
            javascriptreact = javascriptFormatters;
            typescriptreact = javascriptFormatters;
            "*" = [ "codespell" ];
            "_" = [ "trim_whitespace" ];
          };
      };
    };
  };
}
