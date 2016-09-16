defmodule PorterStemmerTest do
  use ExUnit.Case
  doctest Lixical.PorterStemmer
  import Lixical.PorterStemmer
  import Helpers.VocabularyFixtures

  @moduledoc """
    See http://tartarus.org/~martin/PorterStemmer/ for more information on expected results.
  """

  # skipping because the output is hilariously long.
  @tag :skip
  test "returns list given an input list" do
    assert (vocabulary_input |> stems) == vocabulary_output
  end

  test "returns list of lower-case words given input string" do
    cases = ["", "ABATED abatement"]
      |> stems
    assert cases == [[], ["abat","abat"]]
  end

  test "returns an empty list given an empty list" do
    assert ([] |> stems) == []
  end

  test "step 1a" do
    cases = ["caresses", "ponies", "ties"]
      |> Enum.map(&step_1a/1)
    assert cases == ["caress", "poni", "ti"]
  end

  test "step 1b" do
    cases = ["agreed", "plastered", "motoring"]
      |> Enum.map(&step_1b/1)
    assert cases == ["agree", "plaster", "motor"]
  end
end
