use Mix.Config

config :phoenix, Exchange.Router,
  http: [port: System.get_env("PORT") || 4001],
