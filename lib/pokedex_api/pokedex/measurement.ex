defmodule PokedexApi.Pokedex.Measurement do
  use Ecto.Schema

  alias PokedexApi.Pokedex.Pokemon

  @json_fields [:height, :weight]

  @derive {Jason.Encoder, only: @json_fields}
  schema "measurements" do
    field :height, :string
    field :weight, :string

    belongs_to :pokemon, Pokemon
  end
end
