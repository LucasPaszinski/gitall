defmodule Gitall.PathFinderTest do
  use ExUnit.Case
  doctest Gitall.PathFinder

  alias Gitall.PathFinder

  describe "find_git_in_subdirs/1 with a git folder" do
    setup do
      File.mkdir!("./git_path_test")
      File.mkdir!("./git_path_test/.git")

      on_exit(fn ->
        File.rmdir!("./git_path_test/.git")
        File.rmdir!("./git_path_test")
      end)
    end

    test "returns git folder path" do
      assert ["./git_path_test"] == PathFinder.find_git_in_subdirs(".")
    end
  end

  describe "find_git_in_subdirs/1 without a git folder" do
    setup do
      File.mkdir!("./not_git_path_test")

      on_exit(fn ->
        File.rmdir!("./not_git_path_test")
      end)
    end

    test "when theres not a git folder" do
      assert [] == PathFinder.find_git_in_subdirs(".")
    end
  end
end
