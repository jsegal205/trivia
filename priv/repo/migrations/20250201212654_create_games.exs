defmodule Trivia.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :binary
      add :status, :string

      timestamps(type: :utc_datetime)
    end

    create unique_index(:games, [:name])
  end
end
