defmodule PokedexApi.Repo.Migrations.CreateMeasurements do
  use Ecto.Migration

  def change do
    create table(:measurements) do
      add :height, :string, null: false
      add :weight, :string, null: false
      add :pokemon_id, references(:pokemon)
    end
  end
end
