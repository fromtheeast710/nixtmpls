{
  description = "Personal Website";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in
    with pkgs; {
      devShells.${system}.default = mkShell {
        packages = [
          nodejs-slim_22
          pnpm
        ];
      };
    };
}
