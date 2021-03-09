defmodule Gitall.Printer do
  @doc """
  Print the messages from git
  """
  def print_messages(messages) do
    print_messages_recursive(messages)
  end

  def print_messages_recursive(messages, combined_msg \\ "")

  def print_messages_recursive([{_, msg, path} | tail], combined_msg) do
    updated_msg = combined_msg <> generate_header(path) <> msg
    print_messages_recursive(tail, updated_msg)
  end

  def print_messages_recursive([], combined_msg) do
    IO.puts(combined_msg)
    combined_msg
  end

  defp generate_header(path) do
    "
+------------------------------------------------------------------------------+
\t\t#{path |> Path.basename() |> String.upcase()}
+------------------------------------------------------------------------------+
"
  end
end
