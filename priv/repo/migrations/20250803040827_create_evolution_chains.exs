defmodule PokedexApi.Repo.Migrations.CreateEvolutionChains do
  use Ecto.Migration

  def change do
    create table(:evolution_chains) do
      add :from_, :jsonb, null: true
      add :to, {:array, :jsonb}, null: true
      add :pokemon_id, :integer, null: false, references: :pokemon
    end
  end
end
