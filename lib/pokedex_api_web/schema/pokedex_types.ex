defmodule PokedexApiWeb.Schema.PokedexTypes do
  use Absinthe.Schema.Notation

  object :pokemon do
    field :id, non_null(:integer)
    field :name, non_null(:string)
    field :abilities, :ability |> non_null |> list_of |> non_null
    field :base_stats, non_null(:base_stats)
    field :category, non_null(:string)
    field :entry, non_null(:string)
    field :evolution, non_null(:evolution_chain)
    field :generation, non_null(:integer)
    field :measurement, non_null(:measurement)
    field :sprite, non_null(:string)
    field :types, :string |> non_null |> list_of |> non_null
    field :immunities, :string |> non_null |> list_of |> non_null
    field :resistances, :string |> non_null |> list_of |> non_null
    field :weaknesses, :string |> non_null |> list_of |> non_null
  end

  object :ability do
    field :name, non_null(:string)
    field :effect, :string
    field :is_hidden, non_null(:boolean)
  end

  object :base_stats do
    field :hp, non_null(:integer)
    field :attack, non_null(:integer)
    field :defense, non_null(:integer)
    field :special_attack, non_null(:integer)
    field :special_defense, non_null(:integer)
    field :speed, non_null(:integer)
  end

  object :evolution_chain do
    field :from, :evolution
    field :to, list_of(:evolution)
  end

  object :evolution do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  object :measurement do
    field :height, non_null(:string)
    field :weight, non_null(:string)
  end
end
