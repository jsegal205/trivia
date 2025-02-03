import { Flex, Heading } from "@chakra-ui/react";
import { createFileRoute, Link } from "@tanstack/react-router";

export const Route = createFileRoute("/")({
  component: () => <LandingPage />,
});

const LandingPage = () => (
  <Flex direction="column" alignItems="center">
    <Heading as="h1" fontSize="6xl" lineHeight="normal">
      Welcome to Trivia!
    </Heading>

    <Link to="/games">Browse Games</Link>
  </Flex>
);
