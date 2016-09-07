defmodule Lixical.PorterStemmer do

  def stem([]), do: []
  def stem(""), do: []
  def stem(input) when is_bitstring(input) do
    input
      # |> step_one
      # |> step_two
      # |> step_three
      # |> step_four
      # |> step_five
  end

  def stems([]), do: []

  def stems(input) when is_list(input) do
    Enum.map(input, &stem/1)
  end

  @doc """
    Outputs a list of word stems given a string.
  """
  def stems(input) when is_bitstring(input) do
    input
      |> to_list_of_words
      |> stems
  end

  def stems(input, unique: false) do
    input
      |> stems
      |> remove_duplicates
  end

  @doc """
    The number of times within a string that the pattern vowel-consonant appears.
  """
  defp measure(word) do
    Regex.scan(~r/[aeiou]{1}[bcdfghjklmnpqrstvwxyz]{1}/ix, word)
      |> Enum.count
  end

  defp to_list_of_words(string) do
    string
      |> String.replace(~r/[\p{P}\p{S}]/, "") # Remove special characters
      |> String.split(" ") # Split to list of words
  end
end
