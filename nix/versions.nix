{
  # App release version — bump on every release. Keep in sync with:
  #   desktop/src-tauri/Cargo.toml, desktop/src-tauri/tauri.conf.json
  buzzVersion = "0.5.17";

  # sherpa-onnx static library archive for huddle audio.
  # Per-platform archive URL and hash. Version tracks the sherpa-onnx-sys crate.
  # Regenerate hashes after version bump: run
  #   nix-prefetch-url <url>
  # for each platform.
  sherpaOnnx = {
    version = "1.13.4";
    systems = {
      "x86_64-linux" = {
        urlSuffix = "linux-x64-static-lib";
        hash = "sha256-mLDjGZZCb254JE284ZVVSPLGTo8BxL51uFr3zaoujVw=";
      };
      "aarch64-linux" = {
        urlSuffix = "linux-aarch64-static-lib";
        hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      };
      "aarch64-darwin" = {
        urlSuffix = "osx-arm64-static-lib";
        hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
      };
    };
  };

  # Cargo.lock output hashes for sidecar builds (workspace root Cargo.lock).
  # One hash per unique git source. Regenerate after Cargo.lock changes:
  # set to a fake hash and let `nix build` report the correct one.
  sidecarCargoOutputHashes = {
    "aws-creds-0.39.1" = "sha256-QAAm1phmeLFtDRgfDCoHijN1ce/rYzh18KziOUbL+hw=";
    "mesh-llm-api-client-0.75.1" = "sha256-RXjmM66u40cxnacbvTtCFJShMK4BM+MHOyJ2vQ7Gw60=";
  };

  # Cargo.lock output hashes for the desktop Tauri build (desktop/src-tauri/Cargo.lock).
  # Same mesh-llm git source/rev as the sidecars, so same hash here.
  desktopCargoOutputHashes = {
    "mesh-llm-api-client-0.75.1" = "sha256-RXjmM66u40cxnacbvTtCFJShMK4BM+MHOyJ2vQ7Gw60=";
  };

  # Hash for pnpm dependencies (desktop frontend).
  # Regenerate after package.json / pnpm-lock.yaml changes: set to a fake hash
  # and let `nix build` report the correct one.
  pnpmHash = "sha256-+YUfxmJOyPE5dB4vVVuArBcEliTb+sZSJoFjuPwUvx0=";
}
