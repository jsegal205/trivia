defmodule TriviaWeb.Resolvers.GameResolver do
  @moduledoc """
  Module to interface between GQL schemas and context modules
  """
  alias Trivia.Players.Player
  alias Trivia.Repo
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

  def join_game(%{id: id, name: player_name}, _context) do
    multi =
      Ecto.Multi.new()
      |> Ecto.Multi.run(:get_game, fn _repo, _changes ->
        case Games.get_game(id) do
          nil -> {:error, "Game not found"}
          game -> {:ok, game}
        end
      end)
      |> Ecto.Multi.insert(:create_player, fn _changes ->
        Player.changeset(%Player{}, %{name: player_name})
      end)
      |> Ecto.Multi.run(:add_player_to_game, fn _repo, %{get_game: game, create_player: player} ->
        Games.add_player(game, player)
      end)

    case Repo.transaction(multi) do
      {:ok, %{add_player_to_game: updated_game}} ->
        {:ok, updated_game}

      {:error, _step, reason, _changes} ->
        {:error, reason}
    end
  end
end
