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
    {status, reply} = GenServer.call(pid, {:turn, word})
    IO.puts(reply)

    status
  end

  # server
  @impl true
  def init(initial) do
    board = Board.new(initial)
    IO.puts(Board.show(board))
    {:ok, board}
  end

  @impl true
  def handle_call({:turn, word}, _from, board) do
    make_validated_move(board, word)
  end

  def make_validated_move(board, word) do
    with {:ok, word} <- Errors.validate(word, hd(board.moves)) do
      board
      |> Board.turn(word)
      |> reply_or_finish()
    else
      {:error, errors} ->
        reply =
          Enum.join([Board.show(board) | errors], "\n")

        {:reply, {:ok, reply}, board}
    end
  end

  defp reply_or_finish(board) do
    reply = Board.show(board)

    cond do
      Board.won?(board) -> {:stop, :normal, {:done, reply}, board}
      true -> {:reply, {:ok, reply}, board}
    end
  end

  def child_spec({name, _difficulty} = options) do
    %{id: name, start: {__MODULE__, :start_link, [options]}}
  end
end
