defmodule Trivia.Players.Player do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "players" do
    field :name, :string

    has_many(:player_guesses, Trivia.PlayerGuesses.PlayerGuess)
    many_to_many(:games, Trivia.Games.Game, join_through: "games_players")

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
