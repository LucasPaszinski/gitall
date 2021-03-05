defmodule Gitall.Git do
  def execute(path, command)
      when is_binary(path) and is_binary(command) do
    with ["git" = git | params] <- sanitize_command(command) do
      execute_command(git, params, path)
    else
      MatchError -> {:error, "is not a git command"}
    end
  end

  defp sanitize_command(command) do
    command
    |> String.split()
  end

  defp execute_command(root_cmd, params, path) do
    case System.cmd(root_cmd, params, cd: path, stderr_to_stdout: true) do
      {msg, 0} -> {:ok, msg, path}
      {msg, _} -> {:error, msg, path}
    end
  end
end
