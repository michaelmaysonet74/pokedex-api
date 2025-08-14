alias PokedexApi.Repo
alias PokedexSchema.Pokemon

"priv/repo/data/pokedex.json"
|> File.read!()
|> Jason.decode!()
|> Enum.each(fn pokemon ->
  %Pokemon{}
  |> Pokemon.changeset(pokemon)
  |> Repo.insert!()
end)
