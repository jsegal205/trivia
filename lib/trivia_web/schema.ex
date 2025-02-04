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

    field :games, list_of(:game) do
      resolve(&GameResolver.list_games/2)
    end

    field :game, :game do
      arg(:id, non_null(:id))

      resolve(&GameResolver.get_game/2)
    end
  end

  mutation do
    field :create_game, :game do
      arg(:name, non_null(:string))

      resolve(&GameResolver.create_game/2)
    end

    field :join_game, :game do
      arg(:id, non_null(:id))
      arg(:name, non_null(:string))

      resolve(&GameResolver.join_game/2)
    end
  end

  object :game do
    field :id, :id
    field :name, :string
    field :players, list_of(:player)
  end

  object :player do
    field :name, :string
  end
end
