import { GraphQLClient, gql } from "graphql-request"
import {  useMutation, useQueryClient } from "@tanstack/react-query"
import { apiUrl } from "./helpers"

const createGame = gql`
  mutation CreateGame($name: String!) {
    createGame(name: $name) {
      name
    }
  }
`

const client = new GraphQLClient(apiUrl)

export const useCreateGame = ({successCallback: successCallback}: {successCallback: () => void}) => {
  const queryClient = useQueryClient()
  return useMutation({
    mutationFn: (variables: {name: string}) => client.request(createGame, variables),
    onSuccess: () => {
      queryClient.invalidateQueries({queryKey: ["listGames"]})
      if (typeof successCallback === "function") {
        successCallback();
      }
    }
  })
}
