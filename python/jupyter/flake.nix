{
  description = "Nix Flake for Jupyter Notebooks";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in with pkgs; pkgs.mkShell {
    venvDir = ".venv";
    packages = [
      python3
    ] ++ (with python3Packages; [ 
      jupyter-core 
    ]);
  };
}
