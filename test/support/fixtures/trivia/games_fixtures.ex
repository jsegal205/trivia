defmodule Trivia.Trivia.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Trivia.Trivia.Games` context.
  """

  @doc """
  Generate a unique game name.
  """
  def unique_game_name do
    "game-name-#{Ecto.UUID.generate()}"
  end

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        name: unique_game_name(),
        status: :waiting
      })
      |> Trivia.Trivia.Games.create_game()

    game
  end
end
