# used for any macbook (home, work, etc)
{
  pkgs,
  ...
}:

{
  imports = [ ./common.nix ];

  home.packages = [
    pkgs.kitty
  ];
}
