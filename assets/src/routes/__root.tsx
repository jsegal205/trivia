import { ColorModeButton } from "@/components/ui/color-mode";
import { Flex } from "@chakra-ui/react";
import { Link, Outlet, createRootRoute } from "@tanstack/react-router";
import { TanStackRouterDevtools } from "@tanstack/router-devtools";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

export const Route = createRootRoute({
  component: () => (
    <Flex as="main" direction="column" minHeight="100vh" position="relative">
      <Flex margin="4" justifyContent="space-between">
        <Flex as="nav" gapX="4" alignItems="center">
          <Link to="/">Home</Link>
          <Link to="/games">Games</Link>
        </Flex>
        <ColorModeButton />
      </Flex>

      <Flex margin="4">
        <Outlet />
      </Flex>
      <TanStackRouterDevtools />
      <ReactQueryDevtools />
    </Flex>
  ),
});
