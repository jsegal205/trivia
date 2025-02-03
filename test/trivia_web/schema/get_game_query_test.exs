defmodule TriviaWeb.Schema.GetGameQueryTest do
  use TriviaWeb.GraphQLCase, async: true

  @game_query """
  query GetGame($id: ID!) {
    game(id: $id) {
      id
      name
    }
  }
  """

  describe "Get Game query" do
    test "returns error when no game found", %{conn: conn} do
      uuid = Ecto.UUID.generate() |> Ecto.UUID.cast!()

      response = graphql_request(conn, @game_query, %{id: uuid})

      assert %{
               "data" => %{
                 "game" => nil
               },
               "errors" => [
                 %{"message" => message}
               ]
             } = json_response(response, 200)

      assert "Game not found" == message
    end

    test "success with game", %{conn: conn} do
      %{id: id, name: name} = insert(:game)
      response = graphql_request(conn, @game_query, %{id: id})

      assert %{
               "data" => %{
                 "game" => game
               }
             } = json_response(response, 200)

      assert game["id"] == id
      assert game["name"] == name
    end
  end
end
