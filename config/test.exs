import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :fiberex_catan, FiberexCatan.Repo,
  username: "postgres",
  password: "0psv0033",
  hostname: "localhost",
  database: "fiberex_catan_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :fiberex_catan, FiberexCatanWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "RBEr4P/Ho2oey7JD08BCVEdne3fRbGjAxmHzY9fKI+/Zosxjke82wrsnW3zlMwpJ",
  server: false

# In test we don't send emails.
config :fiberex_catan, FiberexCatan.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
