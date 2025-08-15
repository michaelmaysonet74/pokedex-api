defmodule PokedexApi.Repo.Migrations.CreateEvolutionChains do
  use Ecto.Migration

  def change do
    create table(:evolution_chains) do
      add :from, :map, null: false, default: %{}
      add :to, {:array, :map}, null: false, default: []
      add :pokemon_id, references(:pokemon)
    end
  end
end
