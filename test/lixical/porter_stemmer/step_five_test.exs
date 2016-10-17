defmodule PorterStemmer.StepFiveTest do
  use ExUnit.Case
  doctest PorterStemmer.StepFour
  import PorterStemmer.StepFour

  test "run" do
    cases = [
      "probate",
      "rate",
      "cease",
      "controll",
      "roll"
    ]

    assert Enum.map(cases, &run/1) == [
      "probat",
      "rate",
      "ceas",
      "control",
      "roll"
    ]
  end
end
