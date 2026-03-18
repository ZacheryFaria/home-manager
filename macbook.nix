# used for any macbook (home, work, etc)
{
  user,
  pkgs,
  ...
}:

{
  imports = [ ./common.nix ];

  home.packages = [
    (pkgs.callPackage ./pkgs/cmux.nix {})
    pkgs.kitty
  ];

  home.sessionPath = [
    "/Users/${user}/.local/bin"
    "/Users/${user}/bin"
  ];
}
