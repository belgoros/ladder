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

  def changes(word1, word2) do
    String.graphemes(word1)
    |> Enum.zip(String.graphemes(word2))
    |> Enum.count(fn {x, y} -> x != y end)
  end

  # Generate a random answer given a difficulty
  # and exactly num_changes changed letters
  def generate(word, num_changes) do
    moves(word)
    |> Stream.drop_while(fn current ->
      changes(word, current) != num_changes
    end)
    |> Enum.take(1)
  end
end
