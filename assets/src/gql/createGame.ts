import { GraphQLClient, gql } from "graphql-request"
import {  useMutation, useQueryClient } from "@tanstack/react-query"

const createGame = gql`
  mutation CreateGame($name: String!) {
    createGame(name: $name) {
      name
    }
  }
`

const client = new GraphQLClient("http://localhost:4000/graphql")

export const useCreateGame = () => {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: (variables: {name: string}) => client.request(createGame, variables),
    onSuccess: () => {
      queryClient.invalidateQueries({queryKey: ["listGames"]})
    }

  })
}
