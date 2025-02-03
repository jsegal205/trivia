defmodule TriviaWeb.Schema.PingTest do
  use TriviaWeb.GraphQLCase, async: true

  @ping_query """
  query {
    ping
  }
  """

  test "ping", %{conn: conn} do
    response = graphql_request(conn, @ping_query)

    assert %{
             "data" => %{
               "ping" => "pong"
             }
           } == json_response(response, 200)
  end
end
