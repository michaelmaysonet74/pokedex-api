defmodule PokedexApi.Repo do
  use Ecto.Repo,
    otp_app: :pokedex_api,
    adapter: Ecto.Adapters.Postgres
end
