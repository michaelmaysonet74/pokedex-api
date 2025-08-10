alias PokedexApi.Repo
alias PokedexApi.Pokedex.Pokemon

"priv/repo/data/pokedex.json"
|> File.read!()
|> Jason.decode!()
|> Enum.each(fn pokemon ->
  %Pokemon{}
  |> Pokemon.changeset(pokemon)
  |> Repo.insert!()
end)
