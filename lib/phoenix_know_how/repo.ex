defmodule PhoenixKnowHow.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_know_how,
    adapter: Ecto.Adapters.Postgres
end
