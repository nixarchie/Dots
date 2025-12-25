{
  description = "Multi-distro bootstrap (root flake wrapper)";

  inputs = {
    nix.url = "path:./nix";
  };

  outputs = { nix, ... }:
    nix.outputs;
}
