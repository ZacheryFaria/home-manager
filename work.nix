{ config, pkgs, user, homeDir, ... }:

{
  imports = [ ./home.nix ];

  home.shellAliases = {
    ib = "pnpm -r i && bazel configure";
  };

  programs.zsh.initContent = ''
    source /Users/zfaria/.kube-tools/kubech
    source /Users/zfaria/.secrets.sh
  '';

  home.sessionPath = [
    "/Users/zfaria/.local/bin"
    "/Users/zfaria/bin"
  ];

  home.packages = [
    pkgs.grpcurl
    pkgs.golangci-lint
    pkgs.eslint
    pkgs.buf
    pkgs.kubectl
    pkgs.nodejs_24
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  home.sessionVariables = {
    NIX_PATH = "nixpkgs=$HOME/sources/anduril-nixpkgs";
  };
}
