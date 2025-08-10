defmodule PokedexApiWeb.Router do
  use Plug.Router

  import PokedexApiWeb.Controller

  plug(:match)
  plug(:dispatch)

  forward("/graphql", to: Absinthe.Plug, schema: PokedexApiWeb.Schema)

  get("/api/v1/pokemon/:id", do: get_pokemon_by_id(conn, id))
  get("/api/v1/pokemon", do: get_pokemon_by_name(conn))

  match(_, do: send_resp(conn, 404, "Not Found"))
end
