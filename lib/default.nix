{ lib }:
let
  categories = [
    "build"
    "filters"
    "math"
  ];
in
categories
|> builtins.map (category: {
  name = category;
  value = import ./${category}.nix {
    inherit lib;
  };
})
|> builtins.listToAttrs
