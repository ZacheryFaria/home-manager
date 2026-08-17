{ ... }:
{

  programs.nixvim.plugins = {
    lsp = {
      #inlayHints.enable = true;:
      enable = true;

      servers = {
        nixd.enable = true;
        basedpyright.enable = true;

      };
    };
  };

}
