defmodule BooksApiElixir.Authors.Author do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "authors" do
    field :name, :string
    field :biography, :string
    has_many :books, BooksApiElixir.Books.Book

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(authors, attrs) do
    authors
    |> cast(attrs, [:name, :biography])
    |> validate_required([:name])
    |> validate_length(:name, min: 3, max: 100)
    |> unique_constraint(:name)
    |> validate_length(:biography, max: 3000)
  end
end
