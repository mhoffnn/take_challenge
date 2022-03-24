defmodule DesafioTaek.Repo do
  use Ecto.Repo,
    otp_app: :desafioTaek,
    adapter: Ecto.Adapters.Postgres
end
