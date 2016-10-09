defmodule PorterStemmer.StepThreeTest do
  use ExUnit.Case
  doctest PorterStemmer.StepThree
  import PorterStemmer.StepThree

  test "run" do
    cases = [
      "triplicate",
      "formative",
      "formalize",
      "electriciti",
      "electrical",
      "hopeful",
      "goodness"
    ]

    assert Enum.map(cases, &run/1) == [
      "triplic",
      "form",
      "formal",
      "electric",
      "electric",
      "hope",
      "good"
    ]
  end
end
