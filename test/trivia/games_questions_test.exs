defmodule Trivia.GamesQuestionsTest do
  use Trivia.DataCase, async: true

  alias Trivia.Games.Game

  describe "many to many games-questions relationships" do
    setup do
      game = insert(:game)
      question = insert(:question)

      %{game: game, question: question}
    end

    test "associates a question with a game", %{game: game, question: question} do
      game
      |> Repo.preload(:questions)
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:questions, [question])
      |> Repo.update!()

      game = Repo.get!(Game, game.id) |> Repo.preload(:questions)
      assert question in game.questions
    end

    test "deletes association when question is removed", %{game: game, question: question} do
      game
      |> Repo.preload(:questions)
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:questions, [question])
      |> Repo.update!()

      Repo.delete!(question)

      question_id = Ecto.UUID.dump!(question.id)
      refute Repo.exists?(from(gq in "games_questions", where: gq.question_id == ^question_id))
    end

    test "deletes association when game is removed", %{game: game, question: question} do
      game
      |> Repo.preload(:questions)
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:questions, [question])
      |> Repo.update!()

      Repo.delete!(game)

      game_id = Ecto.UUID.dump!(game.id)
      refute Repo.exists?(from(gq in "games_questions", where: gq.game_id == ^game_id))
    end
  end
end
