defmodule Ladder.Board do
  defstruct [:answer, :moves]
  @words Ladder.Dictionary.words()
  @word_index Ladder.Dictionary.index_words(@words)

  def new({initial_word, answer}) do
    %__MODULE__{answer: answer, moves: [initial_word]}
  end

  def turns(board, word) do
    # .. word
  end

  def show(board) do
    # show a bord to the user
  end
end
