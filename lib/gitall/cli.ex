defmodule Gitall.CLI do
  alias Gitall.{PathFinder, Spawner, Printer}

  def main([path, command]) do
    path
    |> PathFinder.find_git_in_subdirs()
    |> Spawner.perform(command)
    |> Printer.print_messages()
  end
end
