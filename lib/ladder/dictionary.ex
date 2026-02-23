defmodule Ladder.Dictionary do
  @file_name "./priv/words.txt"

  def words do
    @file_name
    |> File.read!()
    |> String.split("\n")
  end

  def index_word(word) do
    word
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.map(&{&1, word})
  end

  def index_words(words) do
    words
    |> Enum.flat_map(&index_word/1)
    |> Map.new()
  end
end
