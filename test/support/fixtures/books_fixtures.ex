defmodule BooksApiElixir.BooksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BooksApiElixir.Books` context.
  """

  @doc """
  Generate a book.
  """
  import BooksApiElixir.AuthorsFixtures

  def book_fixture(attrs \\ %{}) do
    author = author_fixture()

    {:ok, book} =
      attrs
      |> Enum.into(%{
        page_number: 42,
        title: "some title",
        author_id: author.id
      })
      |> BooksApiElixir.Books.create_book()

    book
  end
end
