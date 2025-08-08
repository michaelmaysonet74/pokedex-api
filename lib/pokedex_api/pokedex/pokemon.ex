defmodule PokedexApi.Pokedex.Pokemon do
  use Ecto.Schema

  alias PokedexApi.Pokedex.{
    Ability,
    BaseStats,
    EvolutionChain,
    Measurement
  }

  @derive {
    Jason.Encoder,
    only: [
      :id,
      :name,
      :abilities,
      :base_stats,
      :category,
      :entry,
      :evolution,
      :generation,
      :measurement,
      :sprite,
      :types,
      :immunities,
      :resistances,
      :weaknesses
    ]
  }
  schema "pokemon" do
    field :name, :string
    field :category, :string
    field :entry, :string
    field :generation, :integer
    field :sprite, :string
    field :types, {:array, :string}
    field :immunities, {:array, :string}
    field :resistances, {:array, :string}
    field :weaknesses, {:array, :string}

    has_many :abilities, Ability
    has_one :base_stats, BaseStats
    has_one :evolution, EvolutionChain
    has_one :measurement, Measurement
  end
end
