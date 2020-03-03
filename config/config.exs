# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cbs,
  ecto_repos: [Cbs.Repo]

# Configures the endpoint
config :cbs, CbsWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: CbsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Cbs.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :cbs, Cbs.Guardian,
  issuer: "cbs",
  secret_key_base: "qOyl4LLUIzQKOjboGlahQOiA7ggE8AqWMs8BwpBqLivWlDvtOoMyubk72iEaeBVt",
  secret_key: "qOyl4LLUIzQKOjboGlahQOiA7ggE8AqWMs8BwpBqLivWlDvtOoMyubk72iEaeBVt"


config :cbs, CbsWeb.Guardian,
  issuer: "cbs",
  secret_key_base: "qOyl4LLUIzQKOjboGlahQOiA7ggE8AqWMs8BwpBqLivWlDvtOoMyubk72iEaeBVt",
  secret_key: "qOyl4LLUIzQKOjboGlahQOiA7ggE8AqWMs8BwpBqLivWlDvtOoMyubk72iEaeBVt"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
