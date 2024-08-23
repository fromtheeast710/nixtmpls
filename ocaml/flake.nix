{
  description = "Nix Flake for OCaml development";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";

    pkgs = import nixpkgs { inherit system; };
  in with pkgs; pkgs.mkShell {
    packages = [ ocaml ocamlformat ] ++ (with ocamlPackages; [ dune_3 ]);
  };
}
