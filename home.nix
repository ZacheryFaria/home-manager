{
  pkgs,
  claude-code,
  ...
}:

{
  imports = [ ./macbook.nix ];

  nixpkgs.overlays = [
    claude-code.overlays.default
  ];

  home.packages = [
    pkgs.claude-code
  ];

}
