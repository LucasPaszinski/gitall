defmodule GitallTest do
  use ExUnit.Case
  doctest Gitall

  test "greets the world" do
    assert Gitall.hello() == :world
  end
end
