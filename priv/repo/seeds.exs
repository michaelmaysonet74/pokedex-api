alias PokedexApi.Repo
alias PokedexApi.Pokedex.Pokemon

"priv/repo/data/pokedex.json"
|> File.read!()
|> Jason.decode!()
|> Enum.each(fn pokemon ->
  base_stats = pokemon["baseStats"]

  nomalized_base_stats =
    Map.merge(base_stats, %{
      "special_attack" => base_stats["specialAttack"],
      "special_defense" => base_stats["specialDefense"]
    })

  normalized_pokemon = Map.merge(pokemon, %{"base_stats" => nomalized_base_stats})

  %Pokemon{}
  |> Pokemon.changeset(normalized_pokemon)
  |> Repo.insert!()
end)
