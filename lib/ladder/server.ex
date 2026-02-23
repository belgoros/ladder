defmodule Ladder.Server do
  use GenServer

  alias Ladder.Board

  # client
  def start_link(input) do
    GenServer.start_link(__MODULE__, input, name: :ladder)
  end

  def turn(pid \\ :ladder, word) do
    GenServer.call(pid, {:turn, word})
  end

  # server
  def init(init_args) do
    {:ok, Board.new(init_args)}
  end

  def handle_call({:turn, word}, _from, board) do
    new_board = Board.turn(board, word)
    # {:reply, converter, reducer}
    {:reply, Board.show(new_board), new_board}
  end
end
