{
  outputs = _: {
    templates = {
      rust = {
        min = {
          path = ./rust/min;
          description = "Minimal Flake for Rust development";
          welcomeText = ''
          # Minimal Cargo project
          ## Usage

          After initialization, execute:

          ```
          cargo init
          ```
          '';
        };
        tauri = {
          path = ./rust/tauri;
          description = "Flake for Tauri development";
          welcomeText = ''
          # Template Tauri project
          ## Usage

          After initialization, use pnpm to setup Tauri+Svelte

          ## Build will be available soon
          '';
        };
      };
      python = {
        ros = {
          path = ./python/ros;
          description = "Nix Flake for ROS Humble development";
        };
        jupyter = {
          path = ./python/jupyter;
          description = "Nix Flake for Jupyter notebooks";
        };
      };
      svelte = {
        path = ./svelte;
        description = "Flake for Svelte development";
        welcomeText = ''
        # Svelte project
        ## Usage

        Use `pnpm` to setup the project.
        '';
      };
      typst = {
        path = ./typst;
        description = "Flake for Typst notes";
      };
    };
  };
}
