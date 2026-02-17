{
  pkgs,
  ...
}:

{
  imports = [ ./macbook.nix ];

  home.shellAliases = {
    ib = "pnpm -r i && bazel configure";
  };

  programs.zsh.initContent = ''
    source /Users/zfaria/.kube-tools/kubech
    source /Users/zfaria/.secrets.sh
    source /Users/zfaria/.aliases.sh
  '';

  home.packages = [
    pkgs.grpcurl
    pkgs.golangci-lint
    pkgs.eslint
    pkgs.buf
    pkgs.icu
    pkgs.icu.dev
    pkgs.kubectl
    pkgs.docker-credential-helpers
    pkgs.expect
  ];

  home.sessionVariables = {
    NIX_PATH = "nixpkgs=$HOME/sources/anduril-nixpkgs";
    CGO_CFLAGS = "-I$HOME/.nix-profile/include";
    CGO_CXXFLAGS = "-I$HOME/.nix-profile/include";
    CGO_LDFLAGS = "-L$HOME/.nix-profile/lib";
  };
}
