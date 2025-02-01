defmodule Trivia.Games.Game do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "games" do
    field :name, :binary
    field :status, Ecto.Enum, values: [:waiting, :started, :finished]

    many_to_many(:questions, Trivia.Questions.Question, join_through: "games_questions")
    many_to_many(:players, Trivia.Players.Player, join_through: "games_players")

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:name, :status])
    |> validate_required([:name, :status])
    |> unique_constraint(:name)
  end
end
