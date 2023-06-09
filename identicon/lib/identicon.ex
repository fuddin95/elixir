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
    input |> hash |> pick_color |> build_grid |> filter_odd_squares() |> build_pixel_map()
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

  def mirror_row(row) do
    [a, b | _tail] = row
    row ++ [b, a]
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    #  Enum.chunk(hex, 3)
    grid =
      hex
      |> Enum.chunk_every(3, 3, :discard)
      |> Enum.map(&mirror_row/1)
      |> List.flatten()
      |> Enum.with_index()

    %Identicon.Image{image | grid: grid}
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter(grid, fn {code, _index} -> rem(code, 2) == 0 end)

    %Identicon.Image{image | grid: grid}
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map =
      Enum.map(grid, fn {_code, index} ->
        horizontal = rem(index, 5) * 50
        vertical = div(index, 5) * 50

        top_left = {horizontal, vertical}
        bottom_right = {horizontal + 50, vertical + 50}

        {top_left, bottom_right}
      end)

    %Identicon.Image{image | pixel_map: pixel_map}
  end
end
