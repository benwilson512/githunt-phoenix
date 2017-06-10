defmodule GitHunt.Web.Router do
  use GitHunt.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  forward "/graphql", Absinthe.Plug,
    schema: GitHunt.Web.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: GitHunt.Web.Schema
end
