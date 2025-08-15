defmodule PokedexApi.Repo.Migrations.CreateBaseStats do
  use Ecto.Migration

  def change do
    create table(:base_stats) do
      add :hp, :integer, null: false
      add :attack, :integer, null: false
      add :defense, :integer, null: false
      add :special_attack, :integer, null: false
      add :special_defense, :integer, null: false
      add :speed, :integer, null: false
      add :pokemon_id, references(:pokemon)
    end
  end
end
