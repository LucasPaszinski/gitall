defmodule Gitall.GitTest do
  use ExUnit.Case
  doctest Gitall.Git

  alias Gitall.Git

  test "execute with correct params" do
    path = "."
    folder_name = path |> Path.absname() |> Path.rootname() |> Path.basename()

    assert {:ok, _msg, folder_name} = Git.execute(path, "git status")
  end

  test "execute with incorrect params" do
    path = "../not_a_git_repo"
    File.mkdir(path)

    folder_name = path |> Path.absname() |> Path.rootname() |> Path.basename()

    assert {:error, _msg, folder_name} = Git.execute(path, "git status")

    File.rmdir(path)
  end
end
