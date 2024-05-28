defmodule BooksApiElixir.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "books" do
    field :title, :string
    field :page_number, :integer
    belongs_to :author, BooksApiElixir.Authors.Author

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:author_id, :title, :page_number])
    |> validate_required([:author_id, :title])
    |> validate_length(:title, min: 1, max: 100)
    |> validate_number(:page_number, greater_than: 0)
    |> unique_constraint(:title)
  end
end
