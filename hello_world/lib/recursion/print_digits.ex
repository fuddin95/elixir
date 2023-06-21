defmodule HelloWorld.Recursion.PrintDigits do

  # Base case
  # def upto(0) do
  #   # return
  #   :ok
  # end
  # Equivalent

  def upto(0), do: :ok

  def upto(nums) do
    IO.puts(nums) #3,2,1,0
    upto(nums - 1)
  end
end
