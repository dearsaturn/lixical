defmodule PorterStemmer.StepTwoTest do
  use ExUnit.Case
  doctest PorterStemmer.StepTwo
  import PorterStemmer.StepTwo

  test "run" do
    cases = [
      "relational",
      "conditional",
      "rational",
      "valenci",
      "hesitanci",
      "digitizer",
      "conformabli",
      "radicalli",
      "differentli",
      "vileli",
      "analogousli",
      "vietnamization",
      "predication",
      "operator",
      "feudalism",
      "decisiveness",
      "hopefulness",
      "callousness",
      "formaliti",
      "sensitiviti",
      "sensibiliti"
    ]

    assert Enum.map(cases, &run/1) == [
      "relate",
      "condition",
      "rational",
      "valence",
      "hesitance",
      "digitize",
      "conformable",
      "radical",
      "different",
      "vile",
      "analogous",
      "vietnamize",
      "predicate",
      "operate",
      "feudal",
      "decisive",
      "hopeful",
      "callous",
      "formal",
      "sensitive",
      "sensible"
    ]
  end
end
