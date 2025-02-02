defmodule TriviaWeb.GraphQLCase do
  @moduledoc false
  use ExUnit.CaseTemplate

  using do
    quote do
      use TriviaWeb.ConnCase
      import Phoenix.ConnTest
      import Trivia.Factory

      alias TriviaWeb.Router.Helpers, as: Routes

      @endpoint TriviaWeb.Endpoint

      def graphql_request(conn, query, variables \\ %{}) do
        post(conn, "/graphql", %{
          "query" => query,
          "variables" => variables
        })
      end
    end
  end
end
