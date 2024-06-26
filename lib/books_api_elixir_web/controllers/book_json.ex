defmodule BooksApiElixirWeb.BookJSON do
  alias BooksApiElixir.Books.Book

  @doc """
  Renders a list of books.
  """
  def index(%{books: books}) do
    %{data: for(book <- books, do: data(book))}
  end

  @doc """
  Renders a single book.
  """
  def show(%{book: book}) do
    %{data: data(book)}
  end

  defp data(%Book{} = book) do
    %{
      id: book.id,
      title: book.title,
      page_number: book.page_number,
      author_id: book.author_id
    }
  end
end
