defmodule TriviaWeb.Schema do
  @moduledoc false
  use Absinthe.Schema

  query do
    field :ping, :string do
      resolve(fn _, _ ->
        {:ok, "pong"}
      end)
    end
  end
end
