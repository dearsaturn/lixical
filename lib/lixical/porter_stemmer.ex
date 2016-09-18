defmodule Lixical.PorterStemmer do
  import Lixical.Regexes

  def stem([]), do: []
  def stem(""), do: []
  def stem(input) when is_bitstring(input) do
    input
      # |> step_one
      # |> step_two
      # |> step_three
      # |> step_four
      # |> step_five
  end

  def step_one(input) do
    input
      |> step_1a
      |> step_1b
      |> step_1c
  end

  @doc """
    SSES -> SS                         caresses  ->  caress
    IES  -> I                          ponies    ->  poni
                                       ties      ->  ti
    SS   -> SS                         caress    ->  caress
    S    ->                            cats      ->  cat
  """
  def step_1a(input) do
    cond do
      ends_with?(input, "sses") ->
        String.replace_suffix(input, "sses", "ss")

      ends_with?(input, "ies") ->
        String.replace_suffix(input, "ies", "i")

      ends_with?(input, "ss") ->
        String.replace_suffix(input, "ss", "s")

      ends_with?(input, "s") ->
        String.replace_suffix(input, "s", "")

      true ->
        input
    end
  end

  @doc """
    (m>0) EED -> EE                    feed      ->  feed
                                       agreed    ->  agree
    (*v*) ED  ->                       plastered ->  plaster
                                       bled      ->  bled
    (*v*) ING ->                       motoring  ->  motor
                                       sing      ->  sing
  """
  def step_1b(input) do
    cond do
      ends_with?(input, "eed") && measure(input) > 0 ->
        String.replace_suffix(input, "eed", "ee")

      ends_with?(input, "ed") && contains_vowel?(input) ->
        result = String.replace_suffix(input, "ed", "")
        if result !== input, step_1b_additional(result)

      ends_with?(input, "ing") && contains_vowel?(input) ->
        String.replace_suffix(input, "ing", "")
        if result !== input, step_1b_additional(result)

      true ->
        input
    end
  end

  @doc """
    AT -> ATE                       conflat(ed)  ->  conflate
    BL -> BLE                       troubl(ed)   ->  trouble
    IZ -> IZE                       siz(ed)      ->  size
    (*d and not (*L or *S or *Z))
       -> single letter
                                    hopp(ing)    ->  hop
                                    tann(ed)     ->  tan
                                    fall(ing)    ->  fall
                                    hiss(ing)    ->  hiss
                                    fizz(ed)     ->  fizz
    (m=1 and *o) -> E               fail(ing)    ->  fail
                                    fil(ing)     ->  file
  """
  def step_1b_additional(input) do
    cond do
      ends_with?(input, "at") ->
        String.replace_suffix(input, "at", "ate")

      ends_with?(input, "bl") ->
        String.replace_suffix(input, "bl", "ble")

      ends_with?(input, "iz") ->
        String.replace_suffix(input, "iz", "ize")

      ends_with_double_consonant?(input) && does_not_end_with(input, ['l', 's', 'z']) ->
        String.slice(input, 0..-2)

      (measure(input) == 1) && ends_with_cvc?(input) && does_not_end_with?(input, ['w', 'x', 'y']) ->
        input <> "e"
    end
  end

  def step_1c(input) do
    if contains_vowel?(input) && ends_with?(input, "y")
      String.replace_suffix(input, "y", "i")

  end

  def stems([]), do: []

  def stems(input) when is_list(input) do
    Enum.map(input, &stem/1)
  end

  @doc """
    Outputs a list of word stems given a string.
  """
  def stems(input) when is_bitstring(input) do
    input
      |> to_list_of_words
      |> stems
  end

  # def stems(input, unique: false) do
  #   input
  #     |> stems
  #     |> remove_duplicates
  # end

  defp to_list_of_words(string) do
    string
      |> String.replace(~r/[\p{P}\p{S}]/, "") # Remove special characters
      |> String.split(" ") # Split to list of words
  end
end
