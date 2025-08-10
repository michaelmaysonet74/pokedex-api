import Config

config :pokedex_api, ecto_repos: [PokedexApi.Repo]

config :pokedex_api,
  port: System.get_env("PORT", "8080") |> String.to_integer()
