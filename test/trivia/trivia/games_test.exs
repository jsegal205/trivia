defmodule Trivia.GamesTest do
  use Trivia.DataCase

  alias Trivia.Games

  describe "games" do
    alias Trivia.Games.Game

    @invalid_attrs %{name: nil, status: nil}

    test "list_games/0 returns all games" do
      game = insert(:game)
      assert Games.list_games() == [game]
    end

    test "get_game/1 returns the game with given id" do
      game = insert(:game) |> Repo.preload(:players)
      assert game == Games.get_game(game.id)
    end

    test "create_game/1 with valid data creates a game" do
      valid_attrs = %{name: "some name", status: :waiting}

      assert {:ok, %Game{} = game} = Games.create_game(valid_attrs)
      assert game.name == "some name"
      assert game.status == :waiting
    end

    test "create_game/1 with valid data defaults status to :waiting" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Game{} = game} = Games.create_game(valid_attrs)
      assert game.name == "some name"
      assert game.status == :waiting
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = insert(:game)
      update_attrs = %{name: "some updated name", status: :started}

      assert {:ok, %Game{} = game} = Games.update_game(game, update_attrs)
      assert game.name == "some updated name"
      assert game.status == :started
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = insert(:game) |> Repo.preload(:players)
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = insert(:game)
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert nil == Games.get_game(game.id)
    end

    test "change_game/1 returns a game changeset" do
      game = insert(:game)
      assert %Ecto.Changeset{} = Games.change_game(game)
    end

    test "add_player/2 returns {:ok, %Game{}}" do
      %{id: game_id} = game = insert(:game)
      %{id: player_id} = player = insert(:player)

      assert {:ok, %Game{}} = Games.add_player(game, player)

      reloaded_game = Games.get_game(game.id) |> Repo.preload(:players)
      assert reloaded_game.players == [player]

      join_table = Repo.all(from(gp in "games_players", select: [gp.game_id, gp.player_id]))
      assert [[Ecto.UUID.dump!(game_id), Ecto.UUID.dump!(player_id)]] == join_table
    end
  end
end
