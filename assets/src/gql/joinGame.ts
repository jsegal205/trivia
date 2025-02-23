import { GraphQLClient, gql } from "graphql-request";
import { useMutation, useQueryClient } from "@tanstack/react-query";
import { apiUrl } from "./helpers";

const createGame = gql`
  mutation JoinGame($id: ID!, $name: String!) {
    joinGame(id: $id, name: $name) {
      id
    }
  }
`;

const client = new GraphQLClient(apiUrl);

export const useJoinGame = ({
  successCallback: successCallback,
}: {
  successCallback: () => void;
}) => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: (variables: { id: string; name: string }) =>
      client.request<{ joinGame: { id: string } }>(createGame, variables),
    onSuccess: ({ joinGame: { id: id } }) => {
      queryClient.invalidateQueries({ queryKey: ["getGame", id] });
      if (typeof successCallback === "function") {
        successCallback();
      }
    },
  });
};
