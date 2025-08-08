defmodule PokedexApi.Repo.Migrations.CreateBaseStats do
  use Ecto.Migration

  def change do
    create table(:base_stats) do
      add :id, :integer, null: false, primary_key: true
      add :hp, :integer, null: false
      add :attack, :integer, null: false
      add :defense, :integer, null: false
      add :special_attack, :integer, null: false
      add :special_defense, :integer, null: false
      add :speed, :integer, null: false
      add :pokemon_id, :integer, null: false, references: :pokemon
    end
  end
end
