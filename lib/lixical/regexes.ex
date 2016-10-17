defmodule Lixical.Regexes do
  def ends_with_double_consonant?(input) do
    Regex.match? ~r/([bcdfghjklmnpqrstvwxyz])\1\z/ix, input
  end

  def ends_with_cvc?(input) do
    Regex.match? ~r/[bcdfghjklmnpqrstvwxyz]{1}[aeiou]{1}[bcdfghjklmnpqrstvwxyz]{1}\z/ix, input
  end

  def does_not_end_with_cvc?(input)
    ! ends_with_cvc?(input)
  end

  def does_not_end_with?(input, letters) do
    ! String.ends_with? input, letters
  end

  def contains_vowel?(input) do
    Regex.match? ~r/[aeiou]/ix, input
  end

  def measure(word) do
    Regex.scan(~r/[aeiou]{1}[bcdfghjklmnpqrstvwxyz]{1}/ix, word)
      |> Enum.count
  end
end
