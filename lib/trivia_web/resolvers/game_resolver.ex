defmodule TriviaWeb.Resolvers.GameResolver do
  alias Trivia.Games

  def list_games(_args, _context) do
    {:ok, Games.list_games()}
  end

  def create_game(%{name: name}, _context) do
    case Games.create_game(%{name: name}) do
      {:ok, game} -> {:ok, game}
      {:error, reason} -> {:error, reason}
    end
  end
end
