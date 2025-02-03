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
  Flex,
  Heading,
  Input,
} from "@chakra-ui/react";
import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/")({
  component: () => <LandingPage />,
});

const LandingPage = () => (
  <Flex direction="column" alignItems="center">
    <Heading as="h1" fontSize="6xl" lineHeight="normal">
      Welcome to Trivia!
    </Heading>

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
  </Flex>
);
