defmodule PokedexApi.Repo.Migrations.CreatePokemon do
  use Ecto.Migration

  def change do
    create table(:pokemon) do
      add :name, :string, null: false
      add :category, :string, null: false
      add :entry, :text, null: false
      add :generation, :integer, null: false
      add :sprite, :string, null: false
      add :types, {:array, :string}, null: false
      add :immunities, {:array, :string}, null: false
      add :resistances, {:array, :string}, null: false
      add :weaknesses, {:array, :string}, null: false
    end

    create unique_index(:pokemon, [:name])
  end
end
