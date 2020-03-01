defmodule Cbs.Repo do
  use Ecto.Repo,
    otp_app: :cbs,
    adapter: Ecto.Adapters.Postgres
end
