defmodule PokedexApi.Pokedex.EvolutionChain do
  use Ecto.Schema

  alias PokedexApi.Pokedex.Pokemon

  @derive {Jason.Encoder, only: [:from, :to]}
  schema "evolution_chains" do
    field :from, :map, source: :from_
    field :to, {:array, :map}

    belongs_to :pokemon, Pokemon
  end
end
