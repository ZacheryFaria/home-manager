{ ... }:
{

  programs.nixvim.plugins = {
    lsp = {
      #inlayHints.enable = true;:
      enable = true;

      servers = {
        nixd.enable = true;

        # python
        basedpyright.enable = true;
        ruff.enable = true;

        pylsp = {
          enable = true;
          settings.plugins.mypy.enabled = true;
        };

      };
    };
  };

}
