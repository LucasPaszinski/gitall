defmodule Gitall.HelpTest do
  use ExUnit.Case
  doctest Gitall.Help

  alias Gitall.Help

  test "is_help?" do
    assert Help.is_help?(["--h"]) == true
    assert Help.is_help?(["-h"]) == true
    assert Help.is_help?(["--help"]) == true
    assert Help.is_help?(["-help"]) == true
    assert Help.is_help?(["eu", "vim", "ver", "o", "macaco"]) == false
  end

  test "help_text" do
    assert :ok == Help.help_text()
  end
end
