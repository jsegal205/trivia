defmodule Trivia.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :binary

      timestamps(type: :utc_datetime)
    end
  end
end
