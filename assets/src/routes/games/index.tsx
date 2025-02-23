import { Error } from "@/components/error";
import { Loading } from "@/components/loading";
import { NewGameForm } from "@/components/new-game-form";
import { useListGames } from "@/gql/listGames";
import { Flex, Heading, Card, Button } from "@chakra-ui/react";
import { createFileRoute, Link } from "@tanstack/react-router";

export const Route = createFileRoute("/games/")({
  component: RouteComponent,
});

function RouteComponent() {
  return (
    <Flex direction="column">
      <Flex justifyContent="space-evenly">
        <Heading as="h2" size="3xl">
          Hiya games
        </Heading>
        <NewGameForm />
      </Flex>

      <Heading as="h3">Ongoing games:</Heading>
      <Games />
    </Flex>
  );
}

const Games = () => {
  const { isLoading, data, isError, error } = useListGames();

  if (isLoading) {
    return <Loading />;
  }

  if (isError) {
    return <Error message={error.message} />;
  }

  return (
    <Flex justifyContent="center" gap="4" marginTop="2" wrap="wrap">
      {data!.games.length > 0 ? (
        data!.games.map(Game)
      ) : (
        <>No games at this time, try starting one!</>
      )}
    </Flex>
  );
};

const Game = ({ id: id, name: name }: { id: string; name: string }) => {
  return (
    <Card.Root key={name} minWidth="250px">
      <Card.Body>
        <Card.Title>{name}</Card.Title>
        <Card.Description>Players: ###</Card.Description>
      </Card.Body>
      <Card.Footer justifyContent="end">
        <Button>
          <Link to="/games/$id" params={{ id: id }} search={{ join: true }}>
            Join
          </Link>
        </Button>
      </Card.Footer>
    </Card.Root>
  );
};
