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

  @tag :skip
  test "returns list of lower-case words given input string" do
    cases = ["", "ABATED abatement"]
      |> stems
    assert cases == [[], ["abat","abat"]]
  end

  test "returns an empty list given an empty list" do
    assert ([] |> stems) == []
  end
end
