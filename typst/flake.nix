{
  description = "Nix Flake for Typst note-tatking";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in with pkgs; pkgs.mkShell {
    packages = [ typst typstyle ];
  };
}
