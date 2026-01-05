{
  description = "Multi-distro bootstrap (root flake wrapper)";

  inputs = {
    nix.url = "path:./nix";
  };

  outputs =
    { nix, ... }:
    # just forward everything from nix/flake.nix
    nix;
}
