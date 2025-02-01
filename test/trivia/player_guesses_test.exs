defmodule Trivia.PlayerGuessesTest do
  use Trivia.DataCase

  alias Trivia.PlayerGuesses

  describe "player_guesses" do
    alias Trivia.PlayerGuesses.PlayerGuess

    @invalid_attrs %{status: nil, guess: nil, score: nil}

    setup do
      game = insert(:game)
      question = insert(:question)
      player = insert(:player)

      player_guess = insert(:player_guess, game_id: game.id, question: question, player: player)

      %{player_guess: player_guess}
    end

    test "list_player_guesses/0 returns all player_guesses", %{
      player_guess: %{guess: guess, score: score, status: status}
    } do
      assert [
               %PlayerGuess{
                 guess: ^guess,
                 score: ^score,
                 status: ^status
               }
             ] = PlayerGuesses.list_player_guesses()
    end

    test "get_player_guess!/1 returns the player_guess with given id", %{
      player_guess: %{guess: guess, score: score, status: status} = player_guess
    } do
      assert %PlayerGuess{
               guess: ^guess,
               score: ^score,
               status: ^status
             } = PlayerGuesses.get_player_guess!(player_guess.id)
    end

    test "create_player_guess/1 with valid data creates a player_guess" do
      valid_attrs = %{status: :correct, guess: "some guess", score: 42}

      assert {:ok, %PlayerGuess{} = player_guess} = PlayerGuesses.create_player_guess(valid_attrs)
      assert player_guess.status == :correct
      assert player_guess.guess == "some guess"
      assert player_guess.score == 42
    end

    test "create_player_guess/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PlayerGuesses.create_player_guess(@invalid_attrs)
    end

    test "update_player_guess/2 with valid data updates the player_guess", %{
      player_guess: player_guess
    } do
      update_attrs = %{status: :incorrect, guess: "some updated guess", score: 43}

      assert {:ok, %PlayerGuess{} = player_guess} =
               PlayerGuesses.update_player_guess(player_guess, update_attrs)

      assert player_guess.status == :incorrect
      assert player_guess.guess == "some updated guess"
      assert player_guess.score == 43
    end

    test "update_player_guess/2 with invalid data returns error changeset", %{
      player_guess: %{guess: guess, score: score, status: status} = player_guess
    } do
      assert {:error, %Ecto.Changeset{}} =
               PlayerGuesses.update_player_guess(player_guess, @invalid_attrs)

      assert %PlayerGuess{
               guess: ^guess,
               score: ^score,
               status: ^status
             } = PlayerGuesses.get_player_guess!(player_guess.id)
    end

    test "delete_player_guess/1 deletes the player_guess", %{player_guess: player_guess} do
      assert {:ok, %PlayerGuess{}} = PlayerGuesses.delete_player_guess(player_guess)
      assert_raise Ecto.NoResultsError, fn -> PlayerGuesses.get_player_guess!(player_guess.id) end
    end

    test "change_player_guess/1 returns a player_guess changeset", %{player_guess: player_guess} do
      assert %Ecto.Changeset{} = PlayerGuesses.change_player_guess(player_guess)
    end
  end
end
