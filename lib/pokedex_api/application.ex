defmodule PokedexApi.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PokedexApi.Repo,
      {
        Bandit,
        plug: PokedexApiWeb.Endpoint, port: Application.get_env(:pokedex_api, :port)
      }
    ]

    opts = [strategy: :one_for_one, name: PokedexApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
