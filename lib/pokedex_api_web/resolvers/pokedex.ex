defmodule PokedexApiWeb.Resolvers.Pokedex do
  def get_pokemon_by_id(_, %{id: id}, _) do
    PokedexApi.Pokedex.get_pokemon_by(id: id)
  end

  def get_pokemon_by_name(_, %{name: name}, _) do
    PokedexApi.Pokedex.get_pokemon_by(name: name)
  end
end
