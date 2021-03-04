defmodule Gitall.CLI do
  @moduledoc """
  The Cli component of gitall
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gitall.hello()
      :world

  """
  def main(args \\ []) do
    IO.inspect(args)
  end
end
