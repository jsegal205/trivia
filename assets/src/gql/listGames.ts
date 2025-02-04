import { request, gql } from "graphql-request"
import { useQuery } from "@tanstack/react-query"
import { type Game } from "./getGame"
import { apiUrl } from "./helpers"
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
    queryFn: async () => request(apiUrl, listGames)
  })
}
