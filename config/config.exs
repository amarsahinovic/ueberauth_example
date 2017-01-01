# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :ueberauth_example, UeberauthExample.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  render_errors: [accepts: ~w(html json)],
  secret_key_base: "p1cbNLA8NftaX3nJVSBKPuSlCFWlFbs3vCKEklSF8UKE7llxYxsMiw8Y49IL6gsYPS2lxU4sXQT37KOi2Tsmgi2cPRywzqILHF3FqVVeDzXc45TisCbZ1Kl0",
  pubsub: [name: UeberauthExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configure the Ecto Repos
config :ueberauth_example, ecto_repos: [UeberauthExample.Repo]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :ueberauth, Ueberauth,
  providers: [
    buffer: { Ueberauth.Strategy.Buffer, [] }
  ]

config :ueberauth, Ueberauth.Strategy.Buffer.OAuth,
  client_id: System.get_env("BUFFER_CLIENT_ID"),
  client_secret: System.get_env("BUFFER_CLIENT_SECRET"),
  access_token: System.get_env("BUFFER_ACCESS_TOKEN")

config :dogma,
  rule_set: Dogma.RuleSet.All
