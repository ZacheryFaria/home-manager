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
    pkgs.bash
  ];

  programs.zsh = {
    enable = true;
    # initExtraFirst = ''
    #   if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    #     . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    #   fi
    # '';
  };

  home.sessionPath = [
    "/Users/${user}/.local/bin"
    "/Users/${user}/bin"
  ];
}
