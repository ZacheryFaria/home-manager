# used for any mac (home, work, etc)
{
  user,
  pkgs,
  lib,
  ...
}:

{
  imports = [ ./common.nix ];

  home.packages = [
    pkgs.colima
  ];

  programs.zsh = {
    enable = true;
    initContent = lib.mkBefore ''
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
    '';
  };

  home.sessionPath = [
    "/Users/${user}/.local/bin"
    "/Users/${user}/bin"
  ];
}
