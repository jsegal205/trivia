import { request, gql } from "graphql-request"
import { useQuery } from "@tanstack/react-query"

export type Game = {
  id: string;
  name: string;
}

interface GetGameQuery {
  game: Game
}

const getGame = gql`
  query GetGame($id: ID!) {
    game(id: $id) {
      id
      name
    }
  }
`

export const useGetGame = (id: string) => {
  return useQuery<GetGameQuery>({
    queryKey: ["getGame"],
    queryFn: async () => request("http://localhost:4000/graphql", getGame, {id: id})
  })
}
