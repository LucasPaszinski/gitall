defmodule Gitall.Spawner do
  alias Gitall.Git

  @doc """
   Spawn processes to run the git commands and await it's return
  """
  def spawn_git_await_results(paths, command) do
    paths
    |> Enum.map(&start_git_spawn(&1, command))
    |> Enum.map(&receive_message_from_git_spawn(&1))
  end

  defp start_git_spawn(path, command) do
    # Get the PID of this process
    my_self = self()

    # Spawn a function that execute the git command
    # and send a message back with the results
    spawn(fn ->
      result = Git.execute(path, command)

      send(my_self, {:ok, result})
    end)
  end

  defp receive_message_from_git_spawn(_pid) do
    # Receive the message from the other processes
    # and return results
    receive do
      {:ok, result} -> result
    end
  end
end
