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
  Input,
  useDisclosure,
} from "@chakra-ui/react";
import { useEffect, useState } from "react";
import { useJoinGame } from "@/gql/joinGame";

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
    // TODO make better
    return <div>some error: {error.message}</div>;
  }

  return (
    <>
      <div>game {data?.game.name}</div>
      <div>
        Players:
        {data?.game.players.map((player) => <div>{player.name}</div>)}
      </div>
      <Button variant="outline" size="sm" onClick={onOpen}>
        Join Game
      </Button>
      <DialogRoot placement="center" open={open}>
        <DialogBackdrop />

        <DialogContent>
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
    </>
  );
}
