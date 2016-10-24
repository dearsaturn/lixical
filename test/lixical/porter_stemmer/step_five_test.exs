defmodule PorterStemmer.StepFiveTest do
  use ExUnit.Case
  doctest PorterStemmer.StepFive
  import PorterStemmer.StepFive

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
      "rat",
      "ceas",
      "control",
      "roll"
    ]
  end
end
