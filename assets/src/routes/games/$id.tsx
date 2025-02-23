import { useGetGame } from "@/gql/getGame";
import { createFileRoute } from "@tanstack/react-router";

import {
  Button,
  DialogBackdrop,
  DialogBody,
  DialogCloseTrigger,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogRoot,
  DialogTitle,
  Field,
  Flex,
  Heading,
  HStack,
  Input,
  useDisclosure,
} from "@chakra-ui/react";
import { useEffect, useState } from "react";
import { useJoinGame } from "@/gql/joinGame";
import { Error } from "@/components/error";

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

  const [name, setName] = useState<string>("");
  const { open, onOpen, onClose } = useDisclosure();
  const mutation = useJoinGame({ successCallback: onClose });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    mutation.mutate({ id: id, name: name });
  };

  const { isLoading, data, isError, error } = useGetGame(id);

  useEffect(() => {
    if (join) {
      onOpen();
    }
  }, [join]);

  if (isLoading) {
    // TODO make better
    return <div>loading</div>;
  }

  if (isError) {
    return <Error message={error.message} />;
  }

  return (
    <HStack flex="200px 1" position="relative">
      <Flex direction="column">
        <Heading as="h3" fontSize="3xl" minWidth="200px">
          Players:
        </Heading>
        {(data?.game.players || []).length > 0 ? (
          data?.game.players.map((player) => (
            <div key={player.name}>{player.name}</div>
          ))
        ) : (
          <label>No one here yet!</label>
        )}
      </Flex>

      <Flex
        marginX="4"
        direction="row"
        justifyContent="space-between"
        flexGrow="1"
      >
        <Heading as="h1" fontSize="4xl">
          {data?.game.name}
        </Heading>
        <Button variant="solid" size="sm" onClick={onOpen}>
          Join Game
        </Button>
        <DialogRoot open={open}>
          <DialogBackdrop />

          <DialogContent position="absolute">
            <DialogHeader>
              <DialogTitle>Join As</DialogTitle>
            </DialogHeader>
            <DialogBody>
              <Field.Root>
                <Field.Label>Player Name:</Field.Label>
                <Input
                  onChange={(event) => setName(event.target.value)}
                  placeholder="Lloyd Christmas"
                />
              </Field.Root>
            </DialogBody>
            <DialogFooter>
              <Button variant="outline" onClick={onClose}>
                Cancel
              </Button>

              <Button onClick={handleSubmit}>Save</Button>
            </DialogFooter>
            <DialogCloseTrigger />
          </DialogContent>
        </DialogRoot>
      </Flex>
    </HStack>
  );
}
