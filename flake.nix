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

            After initialization, use pnpm to setup Tauri+Svelte project.
          '';
        };
        dioxus = {
          path = ./rust/dioxus;
          description = "Flake for Dioxus development";
          welcomeText = ''
            # Note that Dioxus is still in alpha
          '';
        };
      };
      python = {
        ros = {
          path = ./python/ros;
          description = "Nix Flake for ROS Humble development";
          welcomeText = ''
            # Template ROS Humble project
            ## Source

            Modified from `https://github.com/lopsided98/nix-ros-overlay/`.
          '';
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
      ocaml = {
        path = ./ocaml;
        description = "Flake for OCaml development";
      };
      idris = {
        path = ./idris;
        description = "Flake for Idris 2 development";
      };
    };
  };
}
