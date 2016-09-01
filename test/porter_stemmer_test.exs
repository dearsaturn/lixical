defmodule PorterStemmerTest do
  use ExUnit.Case
  doctest PorterStemmer
  import PorterStemmer
  import VocabularyFixtures

  @moduledoc """
    See http://tartarus.org/~martin/PorterStemmer/ for more information on expected results.
  """
  test "The expected stems are produced" do
    assert (vocabulary_input |> stems) == vocabulary_output
  end
end
