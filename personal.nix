# personal-only extras (non-work machines)
{
  pkgs,
  claude-code,
  ...
}:

{
  nixpkgs.overlays = [
    claude-code.overlays.default
  ];

  home.packages = [
    pkgs.claude-code
  ];
}
