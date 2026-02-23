defmodule Ladder.Server do
  use GenServer

  alias Ladder.{Board, Words}

  # client
  def start_link({name, difficulty}) do
    IO.puts("Starting the game for #{name}")
    initial = Words.random_word()
    answer = Words.generate(initial, difficulty)

    GenServer.start_link(__MODULE__, {initial, answer}, name: name)
  end

  def turn(pid \\ :ladder, word) do
    GenServer.call(pid, {:turn, word})
  end

  # server
  def init(initial) do
    board = Board.new(initial)
    IO.puts(Board.show(board))
    {:ok, board}
  end

  def handle_call({:turn, word}, _from, board) do
    new_board = Board.turn(board, word)
    # {:reply, converter, reducer}
    {:reply, Board.show(new_board), new_board}
  end
end
