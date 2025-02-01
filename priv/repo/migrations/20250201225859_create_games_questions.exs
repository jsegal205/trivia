defmodule Trivia.Repo.Migrations.CreateGamesQuestions do
  use Ecto.Migration

  def change do
    create table(:games_questions, primary_key: false) do
      add :game_id, references(:games, type: :binary_id, on_delete: :delete_all), null: false

      add :question_id, references(:questions, type: :binary_id, on_delete: :delete_all),
        null: false
    end

    create unique_index(:games_questions, [:game_id, :question_id])
  end
end
