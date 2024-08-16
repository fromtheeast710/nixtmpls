{
  description = "Nix Flake for Tauri development";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    nixgl-overlay.url = "github:nix-community/nixGL";
  };

  outputs = { self, nixpkgs, nixgl-overlay, rust-overlay }: let
    allSystems = fn: nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ] (system: fn (import nixpkgs {
        inherit system;
        overlays = [ nixgl-overlay.overlay rust-overlay.overlays.default ];
      }));

    #TODO: not yet finished
    builder = { };
  in {
    packages = allSystems (pkgs: with pkgs; {
      NameOfPkg = callPackage builder { };
      default = self.packages.${system}.NameOfPkg;
    });

    devShells = allSystems (pkgs: with pkgs; let
      rust = rust-bin.fromRustupToolchainFile ./Toolchain.toml;
    in {
      default = mkShell {
        packages = [
          rust
          rust-analyzer-unwrapped
          rust-bin.nightly."2024-04-07".rustfmt
          nodejs-slim_22
          nixgl.nixGLMesa
        ];

        buildInputs = [ gtk3 ];

        env = {
          PKG_CONFIG_PATH="${libsoup.dev}/lib/pkgconfig:${webkitgtk.dev}/lib/pkgconfig";
          RUST_SRC_PATH = "${rust}/lib/rustlib/src/rust/library/";
          RUST_BACKTRACE = "full";
        };
      };});
  };
}