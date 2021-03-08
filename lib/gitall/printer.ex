defmodule Gitall.Printer do
  defp print_header(path) do
    "
+------------------------------------------------------------------------------+
\t\t#{path |> Path.basename() |> String.upcase()}
+------------------------------------------------------------------------------+
"
  end

  # Recursive way
  def print_messages(messages, combined_msg \\ "")

  def print_messages([{_, msg, path} | tail], combined_msg) do
    updated_msg = combined_msg <> print_header(path) <> msg
    print_messages(tail, updated_msg)
  end

  def print_messages([], combined_msg) do
    IO.puts(combined_msg)
    combined_msg
  end
end
