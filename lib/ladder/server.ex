defmodule Ladder.Server do
  @moduledoc false

  use GenServer

  alias Ladder.{Board, Words, Errors}

  # client
  def start_link({name, difficulty}) do
    IO.puts("Starting the game for #{name}")
    initial = Words.random_word()
    answer = Words.generate(initial, difficulty)

    GenServer.start_link(__MODULE__, {initial, answer}, name: name)
  end

  def turn(pid \\ :ladder, word) do
    pid
    |> GenServer.call({:turn, word})
    |> IO.puts()
  end

  # server
  def init(initial) do
    board = Board.new(initial)
    IO.puts(Board.show(board))
    {:ok, board}
  end

  def handle_call({:turn, word}, _from, board) do
    make_validated_move(board, word)
    reply_or_finish(board)
  end

  defp make_validated_move(board, word) do
    with {:ok, word} <- Errors.validate(word, hd(board.moves)) do
      board
      |> Board.turn(word)
      |> reply_or_finish()
    else
      {:error, errors} -> {:reply, Enum.join(errors, "\n"), board}
    end
  end

  defp reply_or_finish(board) do
    reply = Board.show(board)

    cond do
      Board.won?(board) -> {:stop, :normal, reply, board}
      true -> {:reply, reply, board}
    end
  end
end
