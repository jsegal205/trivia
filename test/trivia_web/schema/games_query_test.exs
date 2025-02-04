defmodule TriviaWeb.Schema.GamesQueryTest do
  use TriviaWeb.GraphQLCase, async: true

  @game_query """
  query {
    games {
      id
      name
    }
  }
  """

  describe "Games query" do
    test "success with no games", %{conn: conn} do
      response = graphql_request(conn, @game_query)

      assert %{
               "data" => %{
                 "games" => []
               }
             } == json_response(response, 200)
    end

    test "success with games", %{conn: conn} do
      %{id: id, name: name} = insert(:game)
      response = graphql_request(conn, @game_query)

      assert %{
               "data" => %{
                 "games" => [game]
               }
             } = json_response(response, 200)

      assert game["id"] == id
      assert game["name"] == name
    end
  end
end
