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

export const NewGameForm = () => {
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
            <Input placeholder="me@example.com" />
          </Field.Root>
        </DialogBody>
        <DialogFooter>
          <DialogActionTrigger asChild>
            <Button variant="outline">Cancel</Button>
          </DialogActionTrigger>
          <Button>Save</Button>
        </DialogFooter>
        <DialogCloseTrigger />
      </DialogContent>
    </DialogRoot>
  );
};
