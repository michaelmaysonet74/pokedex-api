import Config

config :pokedex_api, PokedexApi.Repo,
  database: System.get_env("POKEDEX_DB_NAME", "pokedex"),
  username: System.get_env("POKEDEX_DB_USERNAME", "pguser"),
  password: System.get_env("POKEDEX_DB_PASSWORD", "pguser"),
  hostname: System.get_env("POKEDEX_DB_HOSTNAME", "localhost"),
  port:
    System.get_env("POKEDEX_DB_PORT", "5432")
    |> String.to_integer()

config :pokedex_api, ecto_repos: [PokedexApi.Repo]

config :pokedex_api,
  port:
    System.get_env("PORT", "8080")
    |> String.to_integer()
