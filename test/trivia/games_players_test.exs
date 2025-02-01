defmodule Trivia.GamesPlayersTest do
  use Trivia.DataCase, async: true

  alias Trivia.Games.Game

  describe "many to many games-players relationships" do
    setup do
      game = insert(:game)
      player = insert(:player)

      %{game: game, player: player}
    end

    test "associates a player with a game", %{game: game, player: player} do
      game
      |> Repo.preload(:players)
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:players, [player])
      |> Repo.update!()

      game = Repo.get!(Game, game.id) |> Repo.preload(:players)
      assert player in game.players
    end

    test "deletes association when player is removed", %{game: game, player: player} do
      game
      |> Repo.preload(:players)
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:players, [player])
      |> Repo.update!()

      Repo.delete!(player)

      player_id = Ecto.UUID.dump!(player.id)
      refute Repo.exists?(from(gq in "games_players", where: gq.player_id == ^player_id))
    end

    test "deletes association when game is removed", %{game: game, player: player} do
      game
      |> Repo.preload(:players)
      |> Ecto.Changeset.change()
      |> Ecto.Changeset.put_assoc(:players, [player])
      |> Repo.update!()

      Repo.delete!(game)

      game_id = Ecto.UUID.dump!(game.id)
      refute Repo.exists?(from(gq in "games_players", where: gq.game_id == ^game_id))
    end
  end
end
