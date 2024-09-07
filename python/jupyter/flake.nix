{
  description = "Nix Flake for Jupyter Notebooks";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in with pkgs; { devShells.${system}.default = mkShell {
    venvDir = ".venv";
    packages = [
      (python3.withPackages(ps: with ps; [
        numpy
        polars
        plotly
        notebook
      ]))
    ];

    shellHook = "jupyter notebook --no-browser > /dev/null 2>&1 &";
  };};
}
