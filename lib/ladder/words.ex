defmodule Ladder.Words do
  @words Ladder.Dictionary.words()
  @word_index Ladder.Dictionary.index_words(@words)

  def words, do: @words

  def word_index, do: @word_index
end
