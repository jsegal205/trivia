defmodule Trivia.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true, null: false
      add :name, :binary, null: false
      add :status, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:games, [:name])
  end
end
