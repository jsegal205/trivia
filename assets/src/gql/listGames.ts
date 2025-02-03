import {request, gql} from "graphql-request"
import { useQuery } from "@tanstack/react-query"

type Game = {
  name: string
}

interface ListGamesQuery {
  games: Array<Game>
}

const listGames = gql`
  query Games {
    games {
      name
    }
  }
`

export const useListGames = () => {

  return { isFetching: false, data: {games: []}, isError: true, error: {message: "mocked errro"} }

  // return useQuery<ListGamesQuery>({
  //   queryKey: ["listGames"],
  //   queryFn: async () => request("http://localhost:4000/graphql", listGames)
  // })
}
