Code.compiler_options(ignore_module_conflict: true)
:ok = Application.ensure_started(:ex_machina)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Trivia.Repo, :manual)
