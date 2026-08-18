# used for any mac (home, work, etc)
{
  user,
  pkgs,
  lib,
  gruvbox-material-ghostty,
  ...
}:

{
  imports = [ ./common.nix ];

  home.packages = [
    pkgs.colima
  ];

  home.file.".config/ghostty/themes".source = "${gruvbox-material-ghostty}/themes";

  home.file.".config/ghostty/config".text = ''
    font-size = 14
    font-thicken
    font-thicken-strength = 20
    minimum-contrast = 3
    theme = gruvbox-material-hard-dark
  '';

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
