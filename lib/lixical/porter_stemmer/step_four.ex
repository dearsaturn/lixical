defmodule PorterStemmer.StepFour do
  import Lixical.Regexes
  import String, only: [ends_with?: 2, replace_suffix: 3]

  def run(input) do
    cond do
      measure(input) < 2 ->
        input
      ends_with?(input, "al") ->
        replace_suffix(input, "al", "")
      ends_with?(input, "ance") ->
        replace_suffix(input, "ance", "")
      ends_with?(input, "ence") ->
        replace_suffix(input, "ence", "")
      ends_with?(input, "er") ->
        replace_suffix(input, "er", "")
      ends_with?(input, "ic") ->
        replace_suffix(input, "ic", "")
      ends_with?(input, "able") ->
        replace_suffix(input, "able", "")
      ends_with?(input, "ible") ->
        replace_suffix(input, "ible", "")
      ends_with?(input, "ant") ->
        replace_suffix(input, "ant", "")
      ends_with?(input, "ement") ->
        replace_suffix(input, "ement", "")
      ends_with?(input, "ment") ->
        replace_suffix(input, "ment", "")
      ends_with?(input, "ent") ->
        replace_suffix(input, "ent", "")
      ends_with?(input, "tion") ->
        replace_suffix(input, "ion", "")
      ends_with?(input, "sion") ->
        replace_suffix(input, "ion", "")
      ends_with?(input, "ou") ->
        replace_suffix(input, "ou", "")
      ends_with?(input, "ism") ->
        replace_suffix(input, "ism", "")
      ends_with?(input, "ate") ->
        replace_suffix(input, "ate", "")
      ends_with?(input, "iti") ->
        replace_suffix(input, "iti", "")
      ends_with?(input, "ous") ->
        replace_suffix(input, "ous", "")
      ends_with?(input, "ive") ->
        replace_suffix(input, "ive", "")
      ends_with?(input, "ize") ->
        replace_suffix(input, "ize", "")
      true ->
        input
    end
  end
end
