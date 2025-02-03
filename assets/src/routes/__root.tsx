import { ColorModeButton } from "@/components/ui/color-mode";
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
      <Flex margin="4" justifyContent="space-between">
        <Flex as="nav" alignItems="center">
          <Link to="/">Home</Link>
        </Flex>
        <ColorModeButton />
      </Flex>

      <Outlet />
      <TanStackRouterDevtools />
    </Flex>
  ),
});
