defmodule Lixical.Regexes do
  def ends_with_double_consonant?(input) do
    Regex.match? ~r/(#{consonants})\1\z/ix, input
  end

  def ends_with_cvc?(input) do
    Regex.match? ~r/#{consonants}{1}#{vowels}{1}#{consonants}{1}\z/ix, input
  end

  def does_not_end_with_cvc?(input) do
    ! ends_with_cvc?(input)
  end

  def does_not_end_with?(input, letters) do
    ! String.ends_with? input, letters
  end

  def contains_vowel?(input) do
    Regex.match? ~r/#{vowels}/ix, input
  end

  # [C](VC)^m[V]
  def measure(word) do
    stripped = word
      |> strip_leading_consonants
      |> strip_trailing_vowels

    Regex.scan(~r/#{vowels}{1}#{consonants}{1}/ix, stripped)
      |> Enum.count
  end

  def strip_leading_consonants(word) do
    Regex.replace(~r/\A#{consonants}+/, word, "")
  end

  def strip_trailing_vowels(word) do
    Regex.replace(~r/#{vowels}+\z/i, word, "")
  end

  defp vowels, do: "[aeiouy]"
  defp consonants, do: "[bcdfghjklmnpqrstvwxz]"
end
