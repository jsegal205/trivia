defmodule Trivia.PlayerGuessesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Trivia.PlayerGuesses` context.
  """

  @doc """
  Generate a player_guess.
  """
  def player_guess_fixture(attrs \\ %{}) do
    {:ok, player_guess} =
      attrs
      |> Enum.into(%{
        guess: "some guess",
        score: 42,
        status: :correct
      })
      |> Trivia.PlayerGuesses.create_player_guess()

    player_guess
  end
end
