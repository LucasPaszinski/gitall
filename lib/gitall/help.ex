defmodule Gitall.Help do
  @help_args ["--h", "-h", "help", "--help", "-help"]

  def is_help?(args) do
    args
    |> Enum.any?(&is_and_help_args?/1)
  end

  defp is_and_help_args?(arg) do
    Enum.any?(@help_args, &(&1 == arg))
  end

  def help_text() do
    "How to use gitall:

    ./gitall :path_to_root_folder :git_command

    Examples:

    ./gitall . \"git status\"
    ./gitall ../.. \"git pull --rebase\"
    " |> IO.puts()
  end
end
