defmodule FiberexCatan.Repo do
  use Ecto.Repo,
    otp_app: :fiberex_catan,
    adapter: Ecto.Adapters.Postgres
end
