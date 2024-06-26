defmodule BooksApiElixir.AuthorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BooksApiElixir.Authors` context.
  """

  @doc """
  Generate a author.
  """
  def author_fixture(attrs \\ %{}) do
    {:ok, author} =
      attrs
      |> Enum.into(%{
        biography: "some biography",
        name: "some name"
      })
      |> BooksApiElixir.Authors.create_author()

    author
  end
end
