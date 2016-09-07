defmodule RegexesTest do
  import Lixical.Regexes
  use ExUnit.Case
  doctest Lixical.Regexes

  test "ends_with_double_consonant?" do
    cases = ["dodd", "dod"]
      |> Enum.map(&ends_with_double_consonant?/1)

    assert cases == [true, false]
  end

  test "ends_with_cvc?" do
    cases = ["faren", "ape"]
      |> Enum.map(&ends_with_cvc?/1)

    assert cases = [true, false]
  end
end
