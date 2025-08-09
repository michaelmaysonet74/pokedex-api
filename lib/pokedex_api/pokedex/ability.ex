defmodule PokedexApi.Pokedex.Ability do
  use Ecto.Schema

  alias PokedexApi.Pokedex.Pokemon

  @json_fields [:name, :effect, :is_hidden]

  @derive {Jason.Encoder, only: @json_fields}
  schema "abilities" do
    field :name, :string
    field :effect, :string
    field :is_hidden, :boolean, default: false

    belongs_to :pokemon, Pokemon
  end
end
