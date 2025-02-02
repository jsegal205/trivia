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

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### React UI

from the `assets` folder run:

```sh
npm run dev
```

## Testing

```sh
mix test
```
