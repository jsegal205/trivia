defmodule Trivia.Games do
  @moduledoc """
  The Trivia.Games context.
  """

  import Ecto.Query, warn: false
  alias Trivia.Players.Player
  alias Trivia.Repo

  alias Trivia.Games.Game

  @doc """
  Returns the list of games.

  ## Examples

      iex> list_games()
      [%Game{}, ...]

  """
  def list_games do
    Repo.all(Game)
  end

  @doc """
  Gets a single game.

  ## Examples

      iex> get_game(123)
      %Game{}

      iex> get_game(456)
      ** nil

  """
  def get_game(id), do: Repo.get(Game, id)

  @doc """
  Creates a game.

  ## Examples

      iex> create_game(%{field: value})
      {:ok, %Game{}}

      iex> create_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game(attrs \\ %{}) do
    %Game{}
    |> Game.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game.

  ## Examples

      iex> update_game(game, %{field: new_value})
      {:ok, %Game{}}

      iex> update_game(game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game(%Game{} = game, attrs) do
    game
    |> Game.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game.

  ## Examples

      iex> delete_game(game)
      {:ok, %Game{}}

      iex> delete_game(game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game(%Game{} = game) do
    Repo.delete(game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game changes.

  ## Examples

      iex> change_game(game)
      %Ecto.Changeset{data: %Game{}}

  """
  def change_game(%Game{} = game, attrs \\ %{}) do
    Game.changeset(game, attrs)
  end

  @doc """
  Associates a player to a game.

  ## Examples

      iex> add_player(game, player)
      {:ok, %Game{}}

      iex> add_player(game, player)
      {:error, %Ecto.Changeset{}}
  """
  def add_player(%Game{} = game, %Player{} = player) do
    game = Repo.preload(game, :players)

    updated_players = game.players ++ [player]

    game
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:players, updated_players)
    |> Repo.update()
  end
end
