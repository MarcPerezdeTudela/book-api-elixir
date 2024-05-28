defmodule BooksApiElixir.AuthorsTest do
  use BooksApiElixir.DataCase

  alias BooksApiElixir.Authors

  describe "author" do
    alias BooksApiElixir.Authors.Author

    import BooksApiElixir.AuthorsFixtures

    @invalid_attrs %{name: nil, biography: nil}

    test "list_author/0 returns all author" do
      author = author_fixture()
      assert Authors.list_author() == [author]
    end

    test "get_author!/1 returns the author with given id" do
      author = author_fixture()
      assert Authors.get_author!(author.id) == author
    end

    test "create_author/1 with valid data creates a author" do
      valid_attrs = %{name: "some name", biography: "some biography"}

      assert {:ok, %Author{} = author} = Authors.create_author(valid_attrs)
      assert author.name == "some name"
      assert author.biography == "some biography"
    end

    test "create_author/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Authors.create_author(@invalid_attrs)
    end

    test "update_author/2 with valid data updates the author" do
      author = author_fixture()
      update_attrs = %{name: "some updated name", biography: "some updated biography"}

      assert {:ok, %Author{} = author} = Authors.update_author(author, update_attrs)
      assert author.name == "some updated name"
      assert author.biography == "some updated biography"
    end

    test "update_author/2 with invalid data returns error changeset" do
      author = author_fixture()
      assert {:error, %Ecto.Changeset{}} = Authors.update_author(author, @invalid_attrs)
      assert author == Authors.get_author!(author.id)
    end

    test "delete_author/1 deletes the author" do
      author = author_fixture()
      assert {:ok, %Author{}} = Authors.delete_author(author)
      assert_raise Ecto.NoResultsError, fn -> Authors.get_author!(author.id) end
    end

    test "change_author/1 returns a author changeset" do
      author = author_fixture()
      assert %Ecto.Changeset{} = Authors.change_author(author)
    end
  end
end
