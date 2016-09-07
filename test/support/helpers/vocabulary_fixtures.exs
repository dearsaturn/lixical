defmodule Helpers.VocabularyFixtures do
  def vocabulary_input do
    "input.txt"
      |> read_fixture
      |> split_newlines
  end

  def vocabulary_output do
    "output.txt"
      |> read_fixture
      |> split_newlines
  end

  defp read_fixture(file_name) do
    {:ok, words} = Path.join([".", "test", file_name]) |> File.read
    words
  end

  defp split_newlines(string) do
    string |> String.split("\n")
  end
end
