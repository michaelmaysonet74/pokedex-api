defmodule PokedexApi.Repo do
  use Ecto.Repo,
    otp_app: :pokedex_api,
    adapter: if(Mix.env() == :container, do: Ecto.Adapters.SQLite3, else: Ecto.Adapters.Postgres)
end
