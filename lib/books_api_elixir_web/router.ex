defmodule BooksApiElixirWeb.Router do
  use BooksApiElixirWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BooksApiElixirWeb do
    pipe_through :api

    resources "/authors", AuthorController, only: [:index, :create, :show, :update, :delete]
    resources "/books", BookController, only: [:index, :create, :show, :update, :delete]
  end
end
