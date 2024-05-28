defmodule BooksApiElixir.Repo do
  use Ecto.Repo,
    otp_app: :books_api_elixir,
    adapter: Ecto.Adapters.Postgres
end
