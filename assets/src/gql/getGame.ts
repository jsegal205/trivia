import { request, gql } from "graphql-request"
import { useQuery } from "@tanstack/react-query"
import { apiUrl } from "./helpers";

export type Game = {
  id: string;
  name: string;
  players: Array<{name: string}>;
}

interface GetGameQuery {
  game: Game
}

const getGame = gql`
  query GetGame($id: ID!) {
    game(id: $id) {
      id
      name
      players {
        name
      }
    }
  }
`

export const useGetGame = (id: string) => {
  return useQuery<GetGameQuery>({
    queryKey: ["getGame", id],
    queryFn: async () => request(apiUrl, getGame, {id: id})
  })
}
