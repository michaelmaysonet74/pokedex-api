import Config

config :pokedex_api, PokedexApi.Repo,
  database: System.get_env("POKEDEX_DB_NAME", "pokedex"),
  username: System.get_env("POKEDEX_DB_USERNAME", "postgres"),
  password: System.get_env("POKEDEX_DB_PASSWORD", "postgres"),
  hostname: System.get_env("POKEDEX_DB_HOSTNAME", "localhost"),
  port: System.get_env("POKEDEX_DB_PORT", "5432") |> String.to_integer(),
  pool_size: System.get_env("POKEDEX_DB_POOL_SIZE", "10") |> String.to_integer()

config :pokedex_api, ecto_repos: [PokedexApi.Repo]

config :pokedex_api,
  port:
    System.get_env("PORT", "8080")
    |> String.to_integer()
