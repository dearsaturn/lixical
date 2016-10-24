defmodule Lixical.PorterStemmer do
  alias PorterStemmer.{
    StepOne, StepTwo, StepThree, StepFour, StepFive
  }

  def stem([]), do: []
  def stem(""), do: []
  def stem(input) when is_bitstring(input) do
    input
      |> StepOne.run
      |> StepTwo.run
      |> StepThree.run
      |> StepFour.run
      |> StepFive.run
  end

  def stems([]), do: []
  def stems(""), do: []

  def stems(input) when is_list(input) do
    Enum.map input, &stem/1
  end

  def stems(input) when is_bitstring(input) do
    input
      |> to_list_of_words
      |> stems
  end

  defp to_list_of_words(string) do
    string
      |> String.downcase
      |> String.replace(~r/[\p{P}\p{S}]/, "") # Remove special characters
      |> String.split(" ") # Split to list of words
  end
end
