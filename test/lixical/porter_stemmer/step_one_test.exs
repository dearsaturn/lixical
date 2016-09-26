defmodule PorterStemmer.StepOneTest do
  use ExUnit.Case
  doctest PorterStemmer.StepOne
  import PorterStemmer.StepOne

  test "run" do
    cases = ["caresses", "plastered", "conflated", "hopping"]
      |> Enum.map(&run/1)

    assert cases == ["caress", "plaster", "conflate", "hop"]
  end
end
