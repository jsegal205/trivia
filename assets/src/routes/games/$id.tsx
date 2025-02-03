import { useGetGame } from "@/gql/getGame";
import { createFileRoute } from "@tanstack/react-router";

type SearchSchema = {
  join: boolean;
};

export const Route = createFileRoute("/games/$id")({
  component: Game,
  validateSearch: (search: Record<string, unknown>): SearchSchema => {
    return {
      join: (search.join as boolean) || false,
    };
  },
});

function Game() {
  const { id } = Route.useParams();
  const { join } = Route.useSearch();

  const { isLoading, data, isError, error } = useGetGame(id);

  console.log(join);

  if (isLoading) {
    // TODO make better
    return <div>loading</div>;
  }

  if (isError) {
    // TODO make better
    return <div>some error: {error.message}</div>;
  }

  return (
    <div>
      game {data?.game.name}
      --- join ? {join.toString()} ---
    </div>
  );
}
