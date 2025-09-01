defmodule PokedexApiWeb.Controller do
  import Plug.Conn

  alias PokedexApi.Pokedex
  alias PokedexApiWeb.JSON

  def get_pokemon_by_id(conn, id) do
    handle_result(conn, Pokedex.get_pokemon_by(id: id))
  end

  def get_pokemon_by_name(conn) do
    name = conn.query_params["name"]
    handle_result(conn, Pokedex.get_pokemon_by(name: name))
  end

  defp handle_result(conn, result) do
    case result do
      {:ok, pokemon} ->
        JSON.send(conn, pokemon)

      {:error, :not_found} ->
        send_resp(conn, 404, "Not Found")

      {:error, :invalid_input} ->
        send_resp(conn, 400, "Bad Request")
    end
  end
end
