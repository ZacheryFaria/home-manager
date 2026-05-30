# used for any mac (home, work, etc)
{
  user,
  pkgs,
  ...
}:

{
  imports = [ ./common.nix ];

  home.packages = [
    (pkgs.callPackage ./pkgs/cmux.nix { })
    pkgs.colima
  ];

  home.sessionPath = [
    "/Users/${user}/.local/bin"
    "/Users/${user}/bin"
  ];
}
