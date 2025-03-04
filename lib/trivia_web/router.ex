defmodule TriviaWeb.Router do
  use TriviaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]

    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Jason

    plug Absinthe.Plug,
      schema: TriviaWeb.Schema
  end

  scope "/api", TriviaWeb do
    pipe_through :api
  end

  scope "/" do
    # api
    forward "/graphql", Absinthe.Plug, schema: TriviaWeb.Schema
    # gql interface
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: TriviaWeb.Schema
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:trivia, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: TriviaWeb.Telemetry
    end
  end

  # React UI routes
  scope "/", TriviaWeb do
    get "/*path", PageController, :index
  end
end
