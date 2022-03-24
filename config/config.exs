# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :desafioTaek,
  ecto_repos: [DesafioTaek.Repo]

# Configures the endpoint
config :desafioTaek, DesafioTaekWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HxvCMPT4T/B0R1c17PniW/h3edjpctXgQP7O4TrKO2I+B9bDom3D7Z0oF7LRwYHA",
  render_errors: [view: DesafioTaekWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DesafioTaek.PubSub,
  live_view: [signing_salt: "c2HIN8Ap"]

# # Configures Tentacat
# config :tentacat,
#   deserialization_options: [],
#   extra_headers: [],
#   pagination: [],
#   request_options: []

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
