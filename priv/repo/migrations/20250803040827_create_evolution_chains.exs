defmodule PokedexApi.Repo.Migrations.CreateEvolutionChains do
  use Ecto.Migration

  def change do
    create table(:evolution_chains) do
      add :from, :map, null: false
      add :to, {:array, :map}, null: false
      add :pokemon_id, references(:pokemon)
    end
  end
end
