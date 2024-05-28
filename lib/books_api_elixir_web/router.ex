defmodule BooksApiElixirWeb.Router do
  use BooksApiElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BooksApiElixirWeb do
    pipe_through :api
  end
end
