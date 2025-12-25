{
  description = "Multi-distro bootstrap (non-NixOS)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = f:
        nixpkgs.lib.genAttrs systems (system:
          f {
            pkgs = import nixpkgs { inherit system; };
          });
    in {
      packages = forAllSystems ({ pkgs }: {
        bootstrap = pkgs.buildEnv {
          name = "bootstrap-tools";
          paths = [
            pkgs.git
            pkgs.python3
            pkgs.bash
            pkgs.cmake
            pkgs.fastfetch
          ];
        };
      });
    };
}
