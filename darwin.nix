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

  programs.obsidian = {
    enable = true;

    vaults.notes.target = "Documents/Obsidian";

    defaultSettings = {
      communityPlugins = [
        pkgs.obsidianPlugins.dataview
        pkgs.obsidianPlugins.vim-yank-highlight
        pkgs.obsidianPlugins.excalidraw
      ];
    };

    defaultSettings.app = {
      alwaysUpdateLinks = true;
      spellcheck = true;
    };

    defaultSettings.corePlugins = [
      "backlink"
      "bookmarks"
      "daily-notes"
      "file-explorer"
      "global-search"
      "templates"
      "graph"
    ];
  };

  home.sessionPath = [
    "/Users/${user}/.local/bin"
    "/Users/${user}/bin"
  ];
}
