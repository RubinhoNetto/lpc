defmodule Lpc.Repo do
  use Ecto.Repo,
    otp_app: :lpc,
    adapter: Ecto.Adapters.Postgres
end
