defmodule BooksApiElixir.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BooksApiElixir.Books` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        page_number: 42,
        title: "some title"
      })
      |> BooksApiElixir.Books.create_book()

    book
  end
end
