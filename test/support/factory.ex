defmodule Trivia.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Trivia.Repo

  alias Trivia.Questions.Question
  alias Trivia.Games.Game
  alias Trivia.Players.Player

  def game_factory() do
    %Game{
      name: "game-name-#{Ecto.UUID.generate()}",
      status: :waiting
    }
  end

  def player_factory() do
    %Player{
      name: "Johnny Trivia"
    }
  end

  def question_factory() do
    %Question{
      question: "What's the air speed velocity of a swallow",
      answer: "African or European"
    }
  end
end
