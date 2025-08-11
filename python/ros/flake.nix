{
  description = "Nix Flake for ROS Humble development";

  inputs = {
    ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "ros-overlay/nixpkgs";
  };

  outputs = {
    self,
    ros-overlay,
    nixpkgs,
  }:
    ros-overlay.inputs.flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ros-overlay.overlays.default];
      };
    in
      with pkgs; {
        devShells.default = pkgs.mkShell {
          packages =
            [
              colcon

              (with rosPackages.humble;
                buildEnv {
                  paths = [
                    ros-core
                    rqt-gui
                  ];
                })
            ]
            ++ (with python3Packages; [numpy]);
        };
      });
}
