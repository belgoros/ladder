defmodule Ladder.Errors do
  @moduledoc false
  alias Ladder.Words

  def validate(word, previous) do
    case list(word, previous) do
      [] -> {:ok, word}
      errors -> {:error, errors}
    end
  end

  defp list(word, previous) do
    []
    |> maybe_add_error(Words.member?(word), "#{word} is not in our dictionary")
    |> maybe_add_error(Words.has_correct_length?(word), "#{word} must be 4 letters long")
    |> maybe_add_error(
      Words.exactly_one_change?(word, previous),
      "#{word} to previous does not have exactly one change"
    )
  end

  defp maybe_add_error(list, false = _valid, error) do
    [error | list]
  end

  defp maybe_add_error(list, true = _valid, _error) do
    list
  end
end
