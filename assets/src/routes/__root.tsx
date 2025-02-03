import { ColorModeButton } from "@/components/ui/color-mode";
import { Flex } from "@chakra-ui/react";
import { Link, Outlet, createRootRoute } from "@tanstack/react-router";
import { TanStackRouterDevtools } from "@tanstack/router-devtools";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

export const Route = createRootRoute({
  component: () => (
    <Flex
      as="main"
      direction="column"
      justifyContent="space-between"
      minHeight="100vh"
    >
      <Flex margin="4" justifyContent="space-between">
        <Flex as="nav" alignItems="center">
          <Link to="/">Home</Link>
          <Link to="/games">Games</Link>
        </Flex>
        <ColorModeButton />
      </Flex>

      <Outlet />
      <TanStackRouterDevtools />
      <ReactQueryDevtools />
    </Flex>
  ),
});
