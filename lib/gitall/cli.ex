defmodule Gitall.CLI do
  alias Gitall.{PathFinder, Spawner, Printer, Help}

  def main(args) do
    case Help.is_help?(args) do
      true -> Help.help_text()
      false -> run(args)
    end
  end

  defp run([path, command]) do
    path
    |> PathFinder.find_git_in_subdirs()
    |> Spawner.perform(command)
    |> Printer.print_messages()
  end

  defp run(_), do: Help.help_text()
end
