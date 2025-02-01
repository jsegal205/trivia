defmodule Trivia.PlayerGuesses.PlayerGuess do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "player_guesses" do
    field :status, Ecto.Enum, values: [:correct, :incorrect]
    field :guess, :binary
    field :score, :integer
    field :game_id, :binary_id

    belongs_to(:player, Trivia.Players.Player)
    belongs_to(:question, Trivia.Questions.Question)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player_guess, attrs) do
    player_guess
    |> cast(attrs, [:guess, :score, :status])
    |> validate_required([:guess, :score, :status])
  end
end
