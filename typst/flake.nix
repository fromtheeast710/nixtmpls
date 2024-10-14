{
  description = "Nix Flake for Typst note-taking";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in with pkgs; {
    devShells.${system}.default = mkShell {
      packages = [ typst typstyle ];

      shellHook = "typst c ./NOTE.typ && clear";
    };};
}
