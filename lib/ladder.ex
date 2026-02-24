defmodule Ladder do
  @moduledoc false
  @me __MODULE__

  alias Ladder.Server

  def play(difficulty) do
    Server.start_link({@me, difficulty})

    next_turn(:ok)
  end

  def next_turn(:done), do: :yay

  def next_turn(:ok) do
    word =
      IO.gets("Move: ")
      |> String.trim()

    @me
    |> Server.turn(word)
    |> next_turn()
  end
end
