use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :rumbl, Rumbl.Repo,
  username: "rumbl",
  password: "b1aac842-f913-4339-8c08-5ab9e6f8e89c",
  database: "rumbl_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  port: 5440,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rumbl, RumblWeb.Endpoint,
  http: [port: 4002],
  server: false

config :pbkdf2_elixir, :rounds, 1

# Print only warnings and errors during test
config :logger, level: :warn
