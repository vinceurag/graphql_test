# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphqltest,
  ecto_repos: [Graphqltest.Repo]

# Configures the endpoint
config :graphqltest, Graphqltest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Q7Frx67Wdi7hxHGcYqoTxSZwxXCEAK9wI5lGeq/9GQVUbVNi7zSrG6KTDOSlhLWX",
  render_errors: [view: Graphqltest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Graphqltest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Graphqltest",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "hkFjoENHz0r+jXeGqlJy+uY3EVc/Q3CZ/OjFmbAMxRsl6l1K9Ls5f/Wlu7udxgNP",
  serializer: Graphqltest.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
