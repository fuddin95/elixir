defmodule HelloWorld.List do

  def simple_sum(nums), do: sum_tail_recursive(nums)
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)

  def sum_tail_recursive(list, acc \\0)
  def sum_tail_recursive([],acc), do: acc
  def sum_tail_recursive([head | tail], acc) do
    sum_tail_recursive(tail, acc + head)
  end
end
