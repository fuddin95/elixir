defmodule Identicon do
  @moduledoc """
  Documentation for `Identicon`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def main(input) do
    input |> hash |> pick_color |> build_grid
  end

  def hash(input) do
    hex = :crypto.hash(:md5, input) |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    # %Identicon.Image{hex: hex} = image
    # [r, g, b | _tail] = hex
    # [r, g, b]
    # Cleaner way to do it
    # %Identicon.Image{hex:[r,g,b | _tail]} = image
    # Creating a new struct with the color field set
    %Identicon.Image{image | color: {r, g, b}}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    #  Enum.chunk(hex, 3)
    hex |> Enum.chunk(3)
  end
end
