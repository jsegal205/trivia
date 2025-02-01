defmodule Trivia.PlayerGuesses do
  @moduledoc """
  The PlayerGuesses context.
  """

  import Ecto.Query, warn: false
  alias Trivia.Repo

  alias Trivia.PlayerGuesses.PlayerGuess

  @doc """
  Returns the list of player_guesses.

  ## Examples

      iex> list_player_guesses()
      [%PlayerGuess{}, ...]

  """
  def list_player_guesses do
    Repo.all(PlayerGuess)
  end

  @doc """
  Gets a single player_guess.

  Raises `Ecto.NoResultsError` if the Player guess does not exist.

  ## Examples

      iex> get_player_guess!(123)
      %PlayerGuess{}

      iex> get_player_guess!(456)
      ** (Ecto.NoResultsError)

  """
  def get_player_guess!(id), do: Repo.get!(PlayerGuess, id)

  @doc """
  Creates a player_guess.

  ## Examples

      iex> create_player_guess(%{field: value})
      {:ok, %PlayerGuess{}}

      iex> create_player_guess(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_player_guess(attrs \\ %{}) do
    %PlayerGuess{}
    |> PlayerGuess.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a player_guess.

  ## Examples

      iex> update_player_guess(player_guess, %{field: new_value})
      {:ok, %PlayerGuess{}}

      iex> update_player_guess(player_guess, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_player_guess(%PlayerGuess{} = player_guess, attrs) do
    player_guess
    |> PlayerGuess.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a player_guess.

  ## Examples

      iex> delete_player_guess(player_guess)
      {:ok, %PlayerGuess{}}

      iex> delete_player_guess(player_guess)
      {:error, %Ecto.Changeset{}}

  """
  def delete_player_guess(%PlayerGuess{} = player_guess) do
    Repo.delete(player_guess)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking player_guess changes.

  ## Examples

      iex> change_player_guess(player_guess)
      %Ecto.Changeset{data: %PlayerGuess{}}

  """
  def change_player_guess(%PlayerGuess{} = player_guess, attrs \\ %{}) do
    PlayerGuess.changeset(player_guess, attrs)
  end
end
