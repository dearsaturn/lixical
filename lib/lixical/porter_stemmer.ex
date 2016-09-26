defmodule Lixical.PorterStemmer do
  require PorterStemmer.StepOne, as: StepOne

  def stem([]), do: []
  def stem(""), do: []
  def stem(input) when is_bitstring(input) do
    input
      |> StepOne.run
      # |> step_one
      # |> step_two
      # |> step_three
      # |> step_four
      # |> step_five
  end

  def stems([]), do: []
  def stems(""), do: []

  def stems(input) when is_list(input) do
    Enum.map input, &stem/1
  end

  @doc """
    Outputs a list of word stems given a string.
  """
  def stems(input) when is_bitstring(input) do
    input
      |> to_list_of_words
      |> stems
  end

  defp to_list_of_words(string) do
    string
      |> String.replace(~r/[\p{P}\p{S}]/, "") # Remove special characters
      |> String.split(" ") # Split to list of words
  end
end
