defmodule Gitall.PathFinder do
  def find_git_in_subdirs(path) when is_binary(path) do
    path
    |> File.ls!()
    |> Enum.map(&is_subitem_a_folder(path, &1))
    |> Enum.filter(&is_subdir_git?(&1))
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
