defmodule PorterStemmer.StepFive do
  import Lixical.Regexes
  import String, only: [ends_with?: 2, replace_suffix: 3]

  def run(input) do
    input
      |> part_a
      |> part_b
  end

  defp part_a(input) do
    cond do
      measure(input) > 1 && ends_with?(input, "e") ->
        replace_suffix(input, "e", "")

      measure(input) == 1 && does_not_end_with?(input, "oe") ->
        replace_suffix(input, "e", "")

      true ->
        input
    end
  end

  defp part_b(input) do
    cond do
      measure(input) < 1 ->
        input
      ends_with?(input, "ll") ->
        replace_suffix(input, "ll", "l")
      true ->
        input
    end
  end
end
