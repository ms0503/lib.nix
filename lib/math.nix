_: {
  /**
    Calculates the remainder when `a` is divided by `b`.

    # Inputs

    a

    : Dividend

    filters

    : Divisor

    # Type

    ```
    mod :: Int -> Int -> Int
    ```

    # Examples
    :::{.example}
    ## `lib.math.mod` usage example

    ```nix
    mod 5 3
    => 2
    mod 7 10
    => 7
    ```

    :::
  */
  mod = a: b: a - (b * (a / b));
}
