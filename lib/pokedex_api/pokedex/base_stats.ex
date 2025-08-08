defmodule PokedexApi.Pokedex.BaseStats do
  use Ecto.Schema

  alias PokedexApi.Pokedex.Pokemon

  @derive {
    Jason.Encoder,
    only: [:hp, :attack, :defense, :special_attack, :special_defense, :speed]
  }
  schema "base_stats" do
    field :hp, :integer
    field :attack, :integer
    field :defense, :integer
    field :special_attack, :integer
    field :special_defense, :integer
    field :speed, :integer

    belongs_to :pokemon, Pokemon
  end
end
