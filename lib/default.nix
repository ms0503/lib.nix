{ lib }:
{
  build = import ./build.nix {
    inherit lib;
  };
}
