defmodule PorterStemmer do
  def stems([]), do: []

  def stems(word_list) when is_list(word_list) do
  end

  def stems(word) when is_bitstring(word) do
  end
end
