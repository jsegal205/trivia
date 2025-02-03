import { NewGameForm } from "@/components/new-game-form";
import { useListGames } from "@/gql/listGames";
import { Flex, Heading, Table } from "@chakra-ui/react";
import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/games")({
  component: RouteComponent,
});

function RouteComponent() {
  return (
    <Flex>
      <Heading as="h2">Hiya games</Heading>
      <NewGameForm />

      <Games />
    </Flex>
  );
}

const Games = () => {
  const { isFetching, data, isError, error } = useListGames();

  if (isFetching) {
    return <div>loading</div>;
  }

  if (isError) {
    return <div>some error: {error.message}</div>;
  }

  return data!.games.map((game) => <div>{game.name}</div>);
};
