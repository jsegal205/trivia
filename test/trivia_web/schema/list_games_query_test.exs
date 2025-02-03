defmodule TriviaWeb.Schema.ListGamesQueryTest do
  use TriviaWeb.GraphQLCase, async: true

  @list_game_query """
  query {
    games {
      name
    }
  }
  """

  describe "list games query" do
    test "success with no games", %{conn: conn} do
      response = graphql_request(conn, @list_game_query)

      assert %{
               "data" => %{
                 "games" => []
               }
             } == json_response(response, 200)
    end

    test "success with games", %{conn: conn} do
      %{name: name} = insert(:game)
      response = graphql_request(conn, @list_game_query)

      assert %{
               "data" => %{
                 "games" => [game]
               }
             } = json_response(response, 200)

      assert game["name"] == name
    end
  end
end
