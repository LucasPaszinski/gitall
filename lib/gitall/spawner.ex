defmodule Gitall.Spawner do
  alias Gitall.Git

  def perform(paths, command) do
    paths
    |> Enum.map(&start_git_spawn(&1, command))
    |> Enum.map(&receive_message_from_git_spawn(&1))
  end

  defp start_git_spawn(path, command) do
    my_self = self()

    spawn(fn ->
      result = Git.execute(path, command)

      send(my_self, {:ok, result})
    end)
  end

  defp receive_message_from_git_spawn(_pid) do
    receive do
      {:ok, result} -> result
    end
  end
end
