defmodule TriviaWeb.Resolvers.GameResolver do
  @moduledoc """
  Module to interface between GQL schemas and context modules
  """
  alias Trivia.Players
  alias Trivia.Games.Game
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

  def get_game(%{id: id}, _context) do
    case Games.get_game(id) do
      %Game{} = game -> {:ok, game}
      _otherwise -> {:error, "Game not found"}
    end
  end

  def join_game(%{id: id, name: name}, _context) do
    # wrap in a transaction
    with %Game{} = game <- Games.get_game(id),
         {:ok, player} <- Players.create_player(%{name: name}),
         {:ok, updated_game} <- Games.add_player(game, player) do
      {:ok, updated_game}
    else
      {:error, reason} -> {:error, reason}
    end
  end
end
