defmodule BooksApiElixir.Repo.Migrations.AddAuthorsReference do
  use Ecto.Migration

  def change do
    alter table(:books) do
      add :author_id, references(:authors, on_delete: :nothing, type: :binary_id)
    end

    create index(:books, [:author_id])
  end
end
