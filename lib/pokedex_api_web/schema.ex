defmodule PokedexApiWeb.Schema do
  use Absinthe.Schema
  import_types(PokedexApiWeb.Schema.PokedexTypes)

  alias PokedexApiWeb.Resolvers.Pokedex

  query do
    field :pokemon_by_id, :pokemon do
      arg(:id, non_null(:id))
      resolve(&Pokedex.get_pokemon_by_id/3)
    end

    field :pokemon_by_name, :pokemon do
      arg(:name, non_null(:string))
      resolve(&Pokedex.get_pokemon_by_name/3)
    end
  end
end
