defmodule HelloWorld.Recursion.SumDigits do
  def sum(0), do: 0

  def sum(num) do
    sum(num - 1) + num
  end
  def sum_tail_rec(num,acc\\0)
  def sum_tail_rec(0,acc), do: acc
  def sum_tail_rec(num,acc) do
    sum_tail_rec(num - 1,acc + num)
  end
end
