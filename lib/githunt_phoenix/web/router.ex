defmodule GitHunt.Web.Router do
  use GitHunt.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", GitHunt.Web do
    pipe_through :api
  end
end
