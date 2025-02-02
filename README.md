# Trivia

A realtime trivia application using Elixir, Phoenix channels, GraphQL and React

## Setup

### Language versions

This project uses [asdf](https://asdf-vm.com/) to manage the Elixir and Erlang versions of the project.

Follow the instructions on [asdf#getting-started](https://asdf-vm.com/guide/getting-started.html) to install asdf.

Once complete, run the following command to install the correct versions Elixir and Erlang:

```sh
asdf install
```

### Application Dependencies

Install needed serverside dependencies as well as setting up the database.

```sh
mix setup
```

Install clientside dependencies from `assets` folder.

```sh
npm install
```

## Run Locally

### API

```sh
mix phx.server
```

or with interactive shell

```sh
iex -S mix phx.server
```

Now you can visit api routes at [`localhost:4000/api`](http://localhost:4000/api) from your browser.

### React UI

This project uses pnpm as the package manager. Install that first: [https://pnpm.io/installation](https://pnpm.io/installation)

From the `assets` folder run:

```sh
pnpm install
```

## Development

```sh
pnpm run dev
```

Then navigate to the route provided in terminal

## Testing

```sh
mix test
```
