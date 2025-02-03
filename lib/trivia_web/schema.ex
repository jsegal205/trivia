defmodule TriviaWeb.Schema do
  @moduledoc false
  use Absinthe.Schema

  alias TriviaWeb.Resolvers.GameResolver

  query do
    field :ping, :string do
      resolve(fn _, _ ->
        {:ok, "pong"}
      end)
    end
  end

  mutation do
    field :create_game, :game do
      arg(:name, non_null(:string))

      resolve(&GameResolver.create_game/2)
    end
  end

  object :game do
    field :name, :string
  end
end
