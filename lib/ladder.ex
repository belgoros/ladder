defmodule Ladder do
  @moduledoc false
  @me __MODULE__

  alias Ladder.Server

  def play(name) do
    DynamicSupervisor.start_child(:dsup, {Server, {name, 4}})
  end

  def turn(name, word) do
    Server.turn(name, word)
  end
end
