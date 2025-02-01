defmodule Trivia.Repo.Migrations.CreateGamesPlayers do
  use Ecto.Migration

  def change do
    create table(:games_players, primary_key: false) do
      add :game_id, references(:games, type: :binary_id, on_delete: :delete_all), null: false

      add :player_id, references(:players, type: :binary_id, on_delete: :delete_all), null: false
    end

    create unique_index(:games_players, [:game_id, :player_id])
  end
end
