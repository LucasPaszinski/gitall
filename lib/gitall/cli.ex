defmodule Gitall.CLI do
  alias Gitall.PathFinder
  alias Gitall.Git

  def main([path, command] = args) do
    IO.inspect(args)

    path
    |> PathFinder.find_git_in_subdirs()
    |> Enum.map(&Git.execute(&1, command))
    |> IO.inspect()
  end
end
