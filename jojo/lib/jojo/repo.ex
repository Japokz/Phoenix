defmodule Jojo.Repo do
  use Ecto.Repo,
    otp_app: :jojo,
    adapter: Ecto.Adapters.Postgres
end
