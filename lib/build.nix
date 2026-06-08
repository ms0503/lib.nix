{ lib }:
{
  /**
    Pipes `cleanSource` and `cleanSourceWith`.

    # Inputs

    src

    : Unfiltered source

    filters

    : List of filters (all filters must be compatible with `filter` attr of
      `cleanSourceWith` argument)

    # Type

    ```
    cleanSourcePipe :: SourceLike -> [(String -> String -> Bool)] -> SourceLike
    ```

    # Examples
    :::{.example}
    ## `lib.build.cleanSourcePipe` usage example

    ```nix
    src = ./.
    isNotNixDirectory = name: type: !(type == "directory" && builtins.baseNameOf name == "nix")
    isNotNixFiles = name: type: !(type == "file" && (lib.hasSuffix ".nix" name || builtins.baseNameOf name == "flake.lock"))

    cleanSourcePipe src [isNotNixDirectory isNotNixFiles]
    ```

    :::
  */
  cleanSourcePipe =
    src:
    builtins.foldl' (
      filltered-src: filter:
      lib.cleanSourceWith {
        inherit filter;
        src = filltered-src;
      }
    ) (src |> lib.cleanSource);
}
