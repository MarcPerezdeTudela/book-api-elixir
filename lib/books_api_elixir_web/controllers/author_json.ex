defmodule BooksApiElixirWeb.AuthorJSON do
  alias BooksApiElixir.Authors.Author

  @doc """
  Renders a list of author.
  """
  def index(%{authors: authors}) do
    %{data: for(author <- authors, do: data(author))}
  end

  @doc """
  Renders a single author.
  """
  def show(%{author: author}) do
    %{data: data(author)}
  end

  defp data(%Author{} = author) do
    %{
      id: author.id,
      name: author.name,
      biography: author.biography
    }
  end
end
