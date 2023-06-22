defmodule HelloWorld.List do
  @moduledoc """

  Function Summary:

  1. simple_sum
  """

  @doc """
  Returns the sum of numnbers in the list
  """
  @spec sum(list(number())) :: number()

  def simple_sum(nums), do: sum_tail_recursive(nums)
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def sum_tail_recursive(list, acc \\0)
  def sum_tail_recursive([],acc), do: acc
  def sum_tail_recursive([head | tail], acc) do
    sum_tail_recursive(tail, acc + head)
  end

  #_____________________ Reverse a list _______________________
  # Both are same list(any()) and [any()]
  @spec reverse(list(any()), [any()]) :: list(any())
  def reverse(elements, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([head | tail], acc) do
    reverse(tail, [head | acc])
  end

  # _____________________ Map _______________________

  def map(elements, func, acc \\ [])
  def map([], _, acc), do: acc
  def map([head | tail], func, acc) do
    map(tail, func, [func.(head) | acc])
  end

end
