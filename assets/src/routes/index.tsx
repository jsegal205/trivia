import { Flex, Heading } from "@chakra-ui/react";
import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/")({
  component: () => <LandingPage />,
});

const LandingPage = () => (
  <Flex direction="column" alignItems="center">
    <Heading as="h1" fontSize="6xl">
      Welcome to Trivia!
    </Heading>
  </Flex>
);
