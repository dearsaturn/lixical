defmodule Lixical.Regexes do
  def ends_with_double_consonant?(input) do
    Regex.match? ~r/([bcdfghjklmnpqrstvwxyz])\1\z/ix, input
  end

  def ends_with_cvc?(input) do
    Regex.match? ~r/[bcdfghjklmnpqrstvwxyz]{1}[aeiou]{1}[bcdfghjklmnpqrstvwxyz]{1}\z/ix, input
  end

  def does_not_end_with_cvc?(input) do
    ! ends_with_cvc?(input)
  end

  def does_not_end_with?(input, letters) do
    ! String.ends_with? input, letters
  end

  def contains_vowel?(input) do
    Regex.match? ~r/[aeiou]/ix, input
  end

  # [C](VC)^m[V]
  def measure(word) do
    stripped = word |> drop_first_consonant |> drop_last_vowel
    Regex.scan(~r/[aeiou]{1}[bcdfghjklmnpqrstvwxyz]{1}/ix, stripped)
      |> Enum.count
  end

  def strip_leading_consonants(word) do
  end

  def strip_trailing_vowels(word) do
  end
end
