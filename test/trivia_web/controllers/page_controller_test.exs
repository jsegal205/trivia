defmodule TriviaWeb.PageControllerTest do
  use TriviaWeb.ConnCase, async: true

  describe "GET /" do
    test "renders index.html file", %{conn: conn} do
      conn = get(conn, ~p"/")

      assert html_response(conn, 200) =~ "<title>Trivia!</title>"
    end
  end
end
