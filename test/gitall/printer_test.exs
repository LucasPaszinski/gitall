defmodule Gitall.PrinterTest do
  use ExUnit.Case
  doctest Gitall.Printer

  alias Gitall.Printer

  @result "
+------------------------------------------------------------------------------+
\t\tKAIBA
+------------------------------------------------------------------------------+
eu vim ver o macaco"

  describe "find_git_in_subdirs/1 with a git folder" do
    test "returns git folder path" do
      attrs = [{:ok, "eu vim ver o macaco", "kaiba"}]
      assert @result == Printer.print_messages(attrs)
    end
  end
end
