defmodule PokedexApi.Pokedex.EvolutionChain do
  use Ecto.Schema

  alias PokedexApi.Pokedex.Pokemon

  @json_fields [:from, :to]

  @derive {Jason.Encoder, only: @json_fields}
  schema "evolution_chains" do
    field :from, :map, source: :from_
    field :to, {:array, :map}, default: nil

    belongs_to :pokemon, Pokemon
  end
end
