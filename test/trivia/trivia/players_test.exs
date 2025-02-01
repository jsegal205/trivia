defmodule Trivia.Trivia.PlayersTest do
  use Trivia.DataCase

  alias Trivia.Trivia.Players

  describe "players" do
    alias Trivia.Trivia.Players.Player

    @invalid_attrs %{name: nil}

    test "list_players/0 returns all players" do
      player = insert(:player)
      assert Players.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = insert(:player)
      assert Players.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Player{} = player} = Players.create_player(valid_attrs)
      assert player.name == "some name"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = insert(:player)
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Player{} = player} = Players.update_player(player, update_attrs)
      assert player.name == "some updated name"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = insert(:player)
      assert {:error, %Ecto.Changeset{}} = Players.update_player(player, @invalid_attrs)
      assert player == Players.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = insert(:player)
      assert {:ok, %Player{}} = Players.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Players.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = insert(:player)
      assert %Ecto.Changeset{} = Players.change_player(player)
    end
  end
end
