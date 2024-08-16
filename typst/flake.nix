{
  description = "Nix Flake for Typst note-tatking";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { nixpkgs }: let
    system = "x86_64-linux";
  in with nixpkgs.legacyPackages.${system}; {
    devShells.${system}.default = mkShell {
      packages = [ typst ];
    };
  };
}