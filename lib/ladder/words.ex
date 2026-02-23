defmodule Ladder.Words do
  @words Ladder.Dictionary.words()
  @word_index Ladder.Dictionary.index_words(@words)

  def random_word, do: Enum.random(@words)

  def move(word) do
    word
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.flat_map(fn {char, position} -> @word_index[{char, position}] end)
    |> Enum.random()
  end

  def moves(word) do
    word
    |> Stream.iterate(&move/1)
  end
end
