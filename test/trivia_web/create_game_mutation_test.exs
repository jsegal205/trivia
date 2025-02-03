defmodule TriviaWeb.CreateGameMutationTest do
  use TriviaWeb.GraphQLCase, async: true

  @create_game_mutation """
  mutation CreateGame($name: String!) {
    createGame(name: $name) {
      name
    }
  }
  """

  describe "create game mutation" do
    test "success", %{conn: conn} do
      response = graphql_request(conn, @create_game_mutation, %{"name" => "peaches"})

      assert %{
               "data" => %{
                 "createGame" => %{
                   "name" => "peaches"
                 }
               }
             } == json_response(response, 200)
    end
  end
end
