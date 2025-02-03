import { useCreateGame } from "@/gql/createGame";
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
import { useState } from "react";

export const NewGameForm = () => {
  const [name, setName] = useState<string>("");
  const { open, onOpen, onClose } = useDisclosure();
  const mutation = useCreateGame({ successCallback: onClose });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    mutation.mutate({ name: name });
  };

  return (
    <>
      <Button variant="outline" size="sm" onClick={onOpen}>
        Start a new game!
      </Button>
      <DialogRoot placement="center" open={open}>
        <DialogBackdrop />

        <DialogContent position="absolute">
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
};
