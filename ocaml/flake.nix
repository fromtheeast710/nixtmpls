{
  description = "Nix Flake for OCaml development";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };
  in with pkgs; {
    devShells.${system}.default = mkShell {
      packages = [
        ocaml
        ocamlformat
      ] ++ (with ocamlPackages; [
        utop
        dune_3
        ocaml-lsp
      ]);
    };};
}
