defmodule PokedexApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :pokedex_api,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod or Mix.env() == :container,
      deps: deps() ++ container_deps() ++ dev_deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PokedexApi.Application, []}
    ]
  end

  defp deps do
    [
      {:absinthe, "~> 1.7"},
      {:absinthe_plug, "~> 1.5"},
      {:bandit, "~> 1.7"},
      {:ecto_sql, "~> 3.0"},
      {:jason, "~> 1.4"},
      {:postgrex, ">= 0.0.0"},
      {:pokedex_schema,
       git: "https://github.com/michaelmaysonet74/pokedex-schema.git", tag: "v0.2.0"}
    ]
  end

  defp container_deps do
    [
      {:ecto_sqlite3, "~> 0.21.0", only: :container}
    ]
  end

  defp dev_deps do
    [
      {:exsync, "~> 0.4", only: :dev}
    ]
  end
end
