defmodule PokedexApi.Pokedex.Measurement do
  use Ecto.Schema

  alias PokedexApi.Pokedex.Pokemon

  @derive {Jason.Encoder, only: [:height, :weight]}
  schema "measurements" do
    field :height, :string
    field :weight, :string

    belongs_to :pokemon, Pokemon
  end
end
