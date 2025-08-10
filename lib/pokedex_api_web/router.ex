defmodule PokedexApiWeb.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/api/v1/pokemon/:id" do
    PokedexApiWeb.Controller.get_pokemon_by_id(conn, id)
  end

  get "/api/v1/pokemon" do
    PokedexApiWeb.Controller.get_pokemon_by_name(conn)
  end

  forward("/graphql", to: Absinthe.Plug, schema: PokedexApiWeb.Schema)

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
