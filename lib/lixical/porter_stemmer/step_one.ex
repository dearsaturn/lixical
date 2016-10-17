defmodule PorterStemmer.StepOne do
  import Lixical.Regexes
  import String, only: [ends_with?: 2, replace_suffix: 3]

  def run(input) do
    input
      |> part_a
      |> part_b
      |> part_c
  end

  defp part_a(input) do
    cond do
      ends_with?(input, "sses") ->
        replace_suffix(input, "sses", "ss")

      ends_with?(input, "ies") ->
        replace_suffix(input, "ies", "i")

      ends_with?(input, "ss") ->
        replace_suffix(input, "ss", "s")

      ends_with?(input, "s") ->
        replace_suffix(input, "s", "")

      true ->
        input
    end
  end

  defp part_b(input) do
    cond do
      ends_with?(input, "eed") && measure(input) > 0 ->
        replace_suffix(input, "eed", "ee")

      ends_with?(input, "ed") && contains_vowel?(input) ->
        result = replace_suffix(input, "ed", "")
        if result !== input, do: step_1b_additional(result)

      ends_with?(input, "ing") && contains_vowel?(input) ->
        result = replace_suffix(input, "ing", "")
        if result !== input, do: step_1b_additional(result)

      true ->
        input
    end
  end

  defp step_1b_additional(input) do
    cond do
      ends_with?(input, "at") ->
        replace_suffix(input, "at", "ate")

      ends_with?(input, "bl") ->
        replace_suffix(input, "bl", "ble")

      ends_with?(input, "iz") ->
        replace_suffix(input, "iz", "ize")

      ends_with_double_consonant?(input) && does_not_end_with?(input, ["l", "s", "z"]) ->
        String.slice(input, 0..-2)

      measure(input) == 1 &&
        ends_with_cvc?(input) &&
        does_not_end_with?(input, ["w", "x", "y"]) ->

          input <> "e"

      true ->
        input
    end
  end

  defp part_c(input) do
    if contains_vowel?(input) && ends_with?(input, "y") do
      replace_suffix(input, "y", "i")
    else
      input
    end
  end
end
