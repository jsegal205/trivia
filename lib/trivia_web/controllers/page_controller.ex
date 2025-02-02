defmodule TriviaWeb.PageController do
  use TriviaWeb, :controller

  def index(conn, params) do
    conn
    |> put_resp_content_type("text/html")
    |> Plug.Conn.send_file(200, "assets/index.html")
  end
end
