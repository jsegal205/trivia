import { useCreateGame } from "@/gql/createGame";
import {
  Button,
  DialogActionTrigger,
  DialogBackdrop,
  DialogBody,
  DialogCloseTrigger,
  DialogContent,
  DialogFooter,
  DialogHeader,
  DialogRoot,
  DialogTitle,
  DialogTrigger,
  Field,
  Input,
} from "@chakra-ui/react";
import { useState } from "react";

export const NewGameForm = () => {
  const [name, setName] = useState<string>("");
  const mutation = useCreateGame();

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    mutation.mutate({ name: name });
  };

  return (
    <DialogRoot placement="center">
      <DialogBackdrop />
      <DialogTrigger asChild>
        <Button variant="outline" size="sm">
          Start a new game!
        </Button>
      </DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>New Game</DialogTitle>
        </DialogHeader>
        <DialogBody>
          <Field.Root>
            <Field.Label>Game Name:</Field.Label>
            <Input
              onChange={(event) => setName(event.target.value)}
              placeholder="Super Awesome Game"
            />
          </Field.Root>
        </DialogBody>
        <DialogFooter>
          <DialogActionTrigger asChild>
            <Button variant="outline">Cancel</Button>
          </DialogActionTrigger>
          <Button onClick={handleSubmit}>Save</Button>
        </DialogFooter>
        <DialogCloseTrigger />
      </DialogContent>
    </DialogRoot>
  );
};
