defmodule TriviaWeb.Schema.JoinGameMutationTest do
  use TriviaWeb.GraphQLCase, async: true

  @join_game_mutation """
  mutation JoinGame($id: ID!, $name: String!) {
    joinGame(id: $id, name: $name) {
      name
      players {
        name
      }
    }
  }
  """

  describe "join game mutation" do
    test "success", %{conn: conn} do
      game = insert(:game)

      response =
        graphql_request(conn, @join_game_mutation, %{"id" => game.id, "name" => "Johnny"})

      assert %{
               "data" => %{
                 "joinGame" => %{
                   "name" => game.name,
                   "players" => [
                     %{"name" => "Johnny"}
                   ]
                 }
               }
             } == json_response(response, 200)
    end
  end
end
