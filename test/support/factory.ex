defmodule Trivia.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Trivia.Repo

  alias Trivia.Trivia.Games.Game
  alias Trivia.Trivia.Players.Player

  def game_factory() do
    %Game{
      name: "game-name-#{Ecto.UUID.generate()}",
      status: :waiting
    }
  end

  def player_factory() do
    %Player{
      name: "player-name-#{Ecto.UUID.generate()}"
    }
  end
end
