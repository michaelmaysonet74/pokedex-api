defmodule PokedexApi.Pokedex.EvolutionChain do
  use Ecto.Schema
  import Ecto.Changeset

  alias PokedexApi.Pokedex.Pokemon

  @json_fields [:from, :to]

  @derive {Jason.Encoder, only: @json_fields}
  schema "evolution_chains" do
    field :from, :map, source: :from_
    field :to, {:array, :map}, default: nil

    belongs_to :pokemon, Pokemon
  end

  def changeset(%__MODULE__{} = evolution_chain, params \\ %{}) do
    evolution_chain
    |> cast(params, [:from, :to])
  end
end
