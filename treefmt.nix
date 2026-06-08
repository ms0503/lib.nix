{ inputs, ... }:
{
  imports = [
    (inputs.treefmt-nix.flakeModule or { })
  ];
  perSystem =
    { lib, ... }:
    lib.optionalAttrs (inputs.treefmt-nix ? flakeModule) {
      treefmt.programs = {
        mdformat = {
          enable = true;
          plugins =
            ps: with ps; [
              mdformat-gfm
            ];
          settings = {
            end-of-line = "lf";
            number = true;
            wrap = 80;
          };
        };
        nixfmt = {
          enable = true;
          excludes = [
            "_sources/generated.nix"
          ];
        };
      };
    };
}
