defmodule Trivia.Factory do
  use ExMachina.Ecto, repo: Trivia.Repo

  alias Trivia.Trivia.Games.Game

  def game_factory() do
    %Game{
      name: "game-name-#{Ecto.UUID.generate()}",
      status: :waiting
    }
  end
end
