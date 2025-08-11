{
  description = "Nix Flake for Idris 2 development";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
    with pkgs; {
      devShells.${system}.default = mkShell {
        packages = [
          rlwrap
          idris2
        ];

        shellHook = "typst c ./NOTE.typ && clear";
      };
    };
}
