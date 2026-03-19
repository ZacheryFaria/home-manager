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
  ];

  home.sessionPath = [
    "/Users/${user}/.local/bin"
    "/Users/${user}/bin"
  ];
}
