defmodule PorterStemmer.StepThree do
  import Lixical.Regexes
  import String, only: [ends_with?: 2, replace_suffix: 3]

  def run(input) do
    cond do
      measure(input) < 1 ->
        input
      ends_with?(input, "icate") ->
        replace_suffix(input, "icate", "ic")
      ends_with?(input, "ative") ->
        replace_suffix(input, "ative", "")
      ends_with?(input, "alize") ->
        replace_suffix(input, "alize", "al")
      ends_with?(input, "iciti") ->
        replace_suffix(input, "iciti", "ic")
      ends_with?(input, "ical")  ->
        replace_suffix(input, "ical", "ic")
      ends_with?(input, "ful")   ->
        replace_suffix(input, "ful", "")
      ends_with?(input, "ness")  ->
        replace_suffix(input, "ness", "")
      true ->
        input
    end
  end
end
