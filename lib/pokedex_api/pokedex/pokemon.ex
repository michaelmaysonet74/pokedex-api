defmodule PokedexApi.Pokedex.Pokemon do
  use Ecto.Schema

  alias PokedexApi.Pokedex.{
    Ability,
    BaseStats,
    EvolutionChain,
    Measurement
  }

  @json_fields [
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

  @derive {Jason.Encoder, only: @json_fields}
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

  def changeset(%__MODULE__{} = pokemon, params \\ %{}) do
    pokemon
    |> Ecto.Changeset.cast(params, [
      :id,
      :name,
      :category,
      :entry,
      :generation,
      :sprite,
      :types,
      :immunities,
      :resistances,
      :weaknesses
    ])
    |> Ecto.Changeset.cast_assoc(:abilities)
    |> Ecto.Changeset.cast_assoc(:base_stats)
    |> Ecto.Changeset.cast_assoc(:evolution)
    |> Ecto.Changeset.cast_assoc(:measurement)
  end
end
