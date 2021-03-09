defmodule Gitall.PathFinder do
  @doc """
  The main function of the CLI.
  This is the function that is called by the escript library.

  ## Examples

      iex> Gitall.PathFinder.find_git_in_subdirs("..")
      ["../gitall"]
  """
  def find_git_in_subdirs(path) when is_binary(path) do
    path
    |> File.ls!()
    |> Stream.map(&is_subitem_a_folder(path, &1))
    |> Stream.filter(&is_subdir_git?(&1))
    |> Enum.map(&elem(&1, 1))
  end

  defp is_subitem_a_folder(root_path, item) do
    path = Path.join(root_path, item)

    case File.dir?(path) do
      true -> {:ok, path}
      false -> {:error, "not a directory"}
    end
  end

  defp is_subdir_git?({:ok, folder_path}) do
    folder_path
    |> File.ls!()
    |> Enum.any?(&(&1 == ".git"))
  end

  defp is_subdir_git?({:error, _reason}), do: false
end
