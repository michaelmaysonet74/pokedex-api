defmodule PokedexApi.Pokedex do
  import Ecto.Query

  alias PokedexApi.Pokedex.{EvolutionChain, Pokemon}
  alias PokedexApi.Repo

  def get_pokemon_by(id: id) when is_binary(id) do
    case Integer.parse(id) do
      {int, ""} -> query(where: [id: int])
      _ -> {:error, :invalid_input}
    end
  end

  def get_pokemon_by(name: name) when is_binary(name) do
    query(where: [name: name])
  end

  def get_pokemon_by(_), do: {:error, :invalid_input}

  defp query(where: where) do
    query =
      from p in Pokemon,
        join: a in assoc(p, :abilities),
        join: b in assoc(p, :base_stats),
        join: e in assoc(p, :evolution),
        join: m in assoc(p, :measurement),
        preload: [abilities: a, base_stats: b, evolution: e, measurement: m],
        where: ^where

    case Repo.one(query) do
      %Pokemon{} = pokemon -> {:ok, pokemon |> normalize_evolution_chain}
      nil -> {:error, :not_found}
    end
  end

  defp normalize_evolution_chain(%Pokemon{evolution: evolution} = pokemon) do
    updated_evolution = %EvolutionChain{
      evolution
      | from: normalize_evolution(evolution.from),
        to:
          case evolution.to || [] do
            [] -> nil
            to -> to |> Enum.map(&normalize_evolution/1) |> Enum.reject(&is_nil/1)
          end
    }

    %Pokemon{pokemon | evolution: updated_evolution}
  end

  defp normalize_evolution(%{"id" => id, "name" => name}), do: %{id: id, name: name}
  defp normalize_evolution(_), do: nil
end
