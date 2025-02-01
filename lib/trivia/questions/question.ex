defmodule Trivia.Questions.Question do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "questions" do
    field :question, :binary
    field :answer, :binary

    many_to_many(:games, Trivia.Games.Game, join_through: "games_questions")
    has_many(:player_guesses, Trivia.PlayerGuesses.PlayerGuess)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :answer])
    |> validate_required([:question, :answer])
  end
end
