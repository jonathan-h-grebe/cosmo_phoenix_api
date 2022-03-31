defmodule Cosmo.Repo do
  use Ecto.Repo,
    otp_app: :cosmo,
    adapter: Ecto.Adapters.Postgres
end
