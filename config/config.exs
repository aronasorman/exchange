# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the router
config :phoenix, Exchange.Router,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT")],
  https: false,
  secret_key_base: "cUXFFCkgoKRA0Zhw6vmd6NkKcrey/+OiH7xQ2LXClSklJrG9LMpDFrlQijDtagmDxyLynFtjYoWuenuWAXz2sQ==",
  catch_errors: true,
  debug_errors: false,
  error_controller: Exchange.PageController

# Session configuration
config :phoenix, Exchange.Router,
  session: [store: :cookie,
            key: "_exchange_key"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
