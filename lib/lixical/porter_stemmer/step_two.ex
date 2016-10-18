defmodule PorterStemmer.StepTwo do
  import Lixical.Regexes
  import String, only: [
    ends_with?: 2, replace_suffix: 3]

  def run(input) do
    cond do
      measure(input) < 1 ->
        input

      ends_with?(input, "rational") ->
        input

      ends_with?(input, "ational") ->
        replace_suffix(input, "ational", "ate")

      ends_with?(input, "tional") ->
        replace_suffix(input, "tional", "tion")

      ends_with?(input, "enci") ->
        replace_suffix(input, "enci", "ence")

      ends_with?(input, "anci") ->
        replace_suffix(input, "anci", "ance")

      ends_with?(input, "izer") ->
        replace_suffix(input, "izer", "ize")

      ends_with?(input, "abli") ->
        replace_suffix(input, "abli", "able")

      ends_with?(input, "alli") ->
        replace_suffix(input, "alli", "al")

      ends_with?(input, "entli") ->
        replace_suffix(input, "entli", "ent")

      ends_with?(input, "eli") ->
        replace_suffix(input, "eli", "e")

      ends_with?(input, "ousli") ->
        replace_suffix(input, "ousli", "ous")

      ends_with?(input, "ization") ->
        replace_suffix(input, "ization", "ize")

      ends_with?(input, "ation") ->
        replace_suffix(input, "ation", "ate")

      ends_with?(input, "ator") ->
        replace_suffix(input, "ator", "ate")

      ends_with?(input, "alism") ->
        replace_suffix(input, "alism", "al")

      ends_with?(input, "iveness") ->
        replace_suffix(input, "iveness", "ive")

      ends_with?(input, "fulness") ->
        replace_suffix(input, "fulness", "ful")

      ends_with?(input, "ousness") ->
        replace_suffix(input, "ousness", "ous")

      ends_with?(input, "aliti") ->
        replace_suffix(input, "aliti", "al")

      ends_with?(input, "iviti") ->
        replace_suffix(input, "iviti", "ive")

      ends_with?(input, "biliti") ->
        replace_suffix(input, "biliti", "ble")

      true ->
        input
    end
  end

end
