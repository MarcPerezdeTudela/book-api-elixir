defmodule BooksApiElixir.Repo.Migrations.CreateAuthor do
  use Ecto.Migration

  def change do
    create table(:authors, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :biography, :text

      timestamps(type: :utc_datetime)
    end

    create index(:authors, [:name], unique: true)
  end
end
