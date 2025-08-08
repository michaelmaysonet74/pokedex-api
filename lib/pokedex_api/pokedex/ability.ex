defmodule PokedexApi.Pokedex.Ability do
  use Ecto.Schema

  alias PokedexApi.Pokedex.Pokemon

  @derive {Jason.Encoder, only: [:name, :effect, :is_hidden]}
  schema "abilities" do
    field :name, :string
    field :effect, :string
    field :is_hidden, :boolean, default: false

    belongs_to :pokemon, Pokemon
  end
end
