import { request, gql } from "graphql-request"
import { useQuery } from "@tanstack/react-query"
import { type Game } from "./getGame"
interface ListGamesQuery {
  games: Array<Game>
}

const listGames = gql`
  query Games {
    games {
      id
      name
    }
  }
`

export const useListGames = () => {
  return useQuery<ListGamesQuery>({
    queryKey: ["listGames"],
    queryFn: async () => request("http://localhost:4000/graphql", listGames)
  })
}
