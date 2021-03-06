# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :cosmo,
  ecto_repos: [Cosmo.Repo]

# Configures the endpoint
config :cosmo, CosmoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1sHEp8MyzcUAubo5gfgJ2N3u59bKz7tRQUjv2V75NfFNKJJRVNXF3X5jGcQtb+ij",
  render_errors: [view: CosmoWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: [name: Cosmo.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
