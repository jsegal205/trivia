defmodule Trivia.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Trivia.Repo

  alias Trivia.Trivia.Games.Game

  def game_factory() do
    %Game{
      name: "game-name-#{Ecto.UUID.generate()}",
      status: :waiting
    }
  end
end
