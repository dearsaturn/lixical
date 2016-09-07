defmodule PorterStemmerTest do
  use ExUnit.Case
  doctest Lixical.PorterStemmer
  import Lixical.PorterStemmer
  import Helpers.VocabularyFixtures

  @moduledoc """
    See http://tartarus.org/~martin/PorterStemmer/ for more information on expected results.
  """
  test "returns list given an input list" do
    assert (vocabulary_input |> stems) == vocabulary_output
  end

  test "returns list of lower-case words given input string" do
    assert ("ABATED abatement" |> stems) == ["abat","abat"]
  end

  test "returns an empty list given an empty list" do
    assert ([] |> stems) == []
  end

end
