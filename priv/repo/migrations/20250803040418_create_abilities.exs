defmodule PokedexApi.Repo.Migrations.CreateAbilities do
  use Ecto.Migration

  def change do
    create table(:abilities) do
      add :name, :string, null: false
      add :effect, :text, null: true
      add :is_hidden, :boolean, null: false, default: false
      add :pokemon_id, :integer, null: false, references: :pokemon
    end
  end
end
