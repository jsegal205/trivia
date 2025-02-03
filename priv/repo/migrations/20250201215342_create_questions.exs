defmodule Trivia.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :question, :string, null: false
      add :answer, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
