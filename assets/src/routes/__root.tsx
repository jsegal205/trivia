import { Flex } from "@chakra-ui/react";
import { Link, Outlet, createRootRoute } from "@tanstack/react-router";
import { TanStackRouterDevtools } from "@tanstack/router-devtools";
export const Route = createRootRoute({
  component: () => (
    <Flex
      as="main"
      direction="column"
      justifyContent="space-between"
      minHeight="100vh"
    >
      <Flex as="nav" margin="4">
        <Link to="/">Home</Link>
      </Flex>
      <Outlet />
      <TanStackRouterDevtools />
    </Flex>
  ),
});
