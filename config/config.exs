# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :githunt_phoenix,
  namespace: GitHunt,
  ecto_repos: [GitHunt.Repo]

# Configures the endpoint
config :githunt_phoenix, GitHunt.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "e/plhL593/REx2L0smIeo5ESszmywPRde5I81iXiBt7RNFYWJpQBOP/N9omwtNJX",
  render_errors: [view: GitHunt.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: GitHunt.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
