defmodule Gitall.CLI do
  alias Gitall.{PathFinder, Spawner, Printer, Help}

  @doc """
  The main function of the CLI.
  This is the function that is called by the escript library.

  ## Examples

      iex> Gitall.main([])
      :ok

  """
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
