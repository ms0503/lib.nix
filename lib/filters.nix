{ lib }:
rec {
  /**
    Checks whether the entry is `nix` directory.

    # Inputs

    name

    : Name of the entry

    type

    : Type of the entry

    # Type

    ```
    isNixDirectory :: String -> String -> Bool
    ```
  */
  isNixDirectory = name: type: type == "directory" && builtins.baseNameOf name == "nix";

  /**
    Checks whether the entry is nix-related file.

    # Inputs

    name

    : Name of the entry

    type

    : Type of the entry

    # Type

    ```
    isNixFiles :: String -> String -> Bool
    ```
  */
  isNixFiles =
    name: type:
    type == "file" && (lib.hasSuffix ".nix" name || builtins.baseNameOf name == "flake.lock");

  /**
    Checks whether the entry is **NOT** `nix` directory.

    # Inputs

    name

    : Name of the entry

    type

    : Type of the entry

    # Type

    ```
    isNotNixDirectory :: String -> String -> Bool
    ```
  */
  isNotNixDirectory = name: type: !(isNixDirectory name type);

  /**
    Checks whether the entry is **NOT** nix-related file.

    # Inputs

    name

    : Name of the entry

    type

    : Type of the entry

    # Type

    ```
    isNotNixFiles :: String -> String -> Bool
    ```
  */
  isNotNixFiles = name: type: !(isNixFiles name type);
}
