{
  description = "Multi-distro bootstrap (non-NixOS)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      # Generate packages per system
      packagesBySystem = nixpkgs.lib.genAttrs systems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          bootstrap = pkgs.buildEnv {
            name = "bootstrap-tools";
            paths = [
              # Shells
              pkgs.bash
              pkgs.fish
              pkgs.zsh

              # Core Utilities
              #pkgs.atuin
              pkgs.bat
              pkgs.btop
              pkgs.curl
              pkgs.fastfetch
              pkgs.fzf
              pkgs.git
              pkgs.htop
              pkgs.lazydocker
              pkgs.lazygit
              pkgs.man-db
              pkgs.starship
              pkgs.wget
              pkgs.nixfmt-rfc-style
              pkgs.zoxide

              # Editors
              pkgs.nano
              pkgs.neovim
              pkgs.vim
              #pkgs.vscode

              # Development
              pkgs.clang
              pkgs.docker
              pkgs.gcc
              pkgs.python3
              pkgs.ruby

              # GUI / Desktop
              #pkgs.chromium
              #pkgs.firefox
              pkgs.foot
              pkgs.fuzzel
              pkgs.kitty
              pkgs.nwg-look
              pkgs.nautilus
              #pkgs.vlc
              pkgs.wofi
            ];
          };
        in
        {
          inherit bootstrap;
          default = bootstrap;
        }
      );
    in
    {
      packages = packagesBySystem;
      formatter = nixpkgs.lib.genAttrs systems (
        system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style
      );
    };
}
