defmodule Trivia.Repo.Migrations.CreatePlayerGuesses do
  use Ecto.Migration

  def change do
    create table(:player_guesses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :guess, :string
      add :score, :integer
      add :status, :string
      add :player_id, references(:players, on_delete: :nothing, type: :binary_id)
      add :game_id, references(:games, on_delete: :nothing, type: :binary_id)
      add :question_id, references(:questions, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:player_guesses, [:player_id])
    create index(:player_guesses, [:game_id])
    create index(:player_guesses, [:question_id])

    create unique_index(:player_guesses, [:player_id, :game_id, :question_id])
  end
end
