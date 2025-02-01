defmodule Trivia.Trivia.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "players" do
    field :name, :binary

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
