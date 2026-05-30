# used for any linux machine (server, wsl, etc)
{
  user,
  pkgs,
  ...
}:

{
  imports = [ ./common.nix ];

  home.sessionPath = [
    "/home/${user}/.local/bin"
    "/home/${user}/bin"
  ];
}
