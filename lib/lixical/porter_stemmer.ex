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
      String.ends_with?(input, "sses") ->
        String.replace_suffix(input, "sses", "ss")

      String.ends_with?(input, "ies") ->
        String.replace_suffix(input, "ies", "i")

      String.ends_with?(input, "ss") ->
        String.replace_suffix(input, "ss", "s")

      String.ends_with?(input, "s") ->
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
      String.ends_with?(input, "eed") && measure(input) > 0 ->
        String.replace_suffix(input, "eed", "ee")

      String.ends_with?(input, "ed") && contains_vowel?(input) ->
        String.replace_suffix(input, "ed", "")

      String.ends_with?(input, "ing") && contains_vowel?(input) ->
        String.replace_suffix(input, "ing", "")
    end
  end

  def step_1c(input) do
    input
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
