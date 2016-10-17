defmodule PorterStemmer.StepFourTest do
  use ExUnit.Case
  doctest PorterStemmer.StepFour
  import PorterStemmer.StepFour

  test "run" do
    cases = [
      "revival",
      "allowance",
      "inference",
      "airliner",
      "gyroscopic",
      "adjustable",
      "defensible",
      "irritant",
      "replacement",
      "adjustment",
      "dependent",
      "adoption",
      "homologou",
      "communism",
      "activate",
      "angulariti",
      "homologous",
      "effective",
      "bowdlerize"
    ]

    assert Enum.map(cases, &run/1) == [
      "reviv",
      "allow",
      "infer",
      "airlin",
      "gyroscop",
      "adjust",
      "defens",
      "irrit",
      "replac",
      "adjust",
      "depend",
      "adopt",
      "homolog",
      "commun",
      "activ",
      "angular",
      "homolog",
      "effect",
      "bowdler"
    ]
  end
end
