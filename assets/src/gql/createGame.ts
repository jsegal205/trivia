import { useQueryClient, useMutation } from "@tanstack/react-query"

const createGame = `
`

export const useCreateGame = () => {
  const queryClient = useQueryClient()

    const mutation = useMutation({
      mutationFn: createGame,
      onSuccess: () => {
        // queryClient.invalidateQueries
      }
    })
}
