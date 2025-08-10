import Config

if config_env() == :container do
  config :pokedex_api, PokedexApi.Repo,
    database: "priv/data/pokedex.sqlite3",
    pool_size: 5
else
  config :pokedex_api, PokedexApi.Repo,
    database: System.get_env("POKEDEX_DB_NAME", "pokedex"),
    username: System.get_env("POKEDEX_DB_USERNAME", "postgres"),
    password: System.get_env("POKEDEX_DB_PASSWORD", "postgres"),
    hostname: System.get_env("POKEDEX_DB_HOSTNAME", "localhost"),
    port: System.get_env("POKEDEX_DB_PORT", "5432") |> String.to_integer(),
    pool_size: System.get_env("POKEDEX_DB_POOL_SIZE", "10") |> String.to_integer()
end
