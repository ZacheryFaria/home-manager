{
  lib,
  buildGoModule,
  fetchFromGitHub,
  makeWrapper,
  git,
  tmux,
}:

buildGoModule (finalAttrs: {
  pname = "canopy";
  version = "0.7.0";

  src = fetchFromGitHub {
    owner = "isacssw";
    repo = "canopy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-6t/GeJeiDCJOaChPkbrBtiX2/O5BjbWaxKdFrF/2XBs=";
  };

  vendorHash = "sha256-P3iFBhlDRS+bTfGRwy2bTPmi83HgIOMPKI364SRUouI=";

  subPackages = [ "cmd/canopy" ];

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${finalAttrs.version}"
  ];

  nativeBuildInputs = [ makeWrapper ];

  # canopy shells out to git and tmux to drive agent sessions. Suffix rather
  # than prefix so an interactive tmux/git already on PATH stays authoritative
  # (a mismatched tmux client can't attach to a running server's socket).
  postInstall = ''
    wrapProgram $out/bin/canopy \
      --suffix PATH : ${
        lib.makeBinPath [
          git
          tmux
        ]
      }
  '';

  meta = {
    description = "Terminal UI for managing parallel AI coding agents";
    homepage = "https://github.com/isacssw/canopy";
    license = lib.licenses.mit;
    mainProgram = "canopy";
    platforms = lib.platforms.unix;
  };
})
