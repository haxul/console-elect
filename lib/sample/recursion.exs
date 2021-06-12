defmodule Math do
  import Enum, only: [reverse: 1]

  def sum(xs), do: do_sum(xs)
  defp do_sum([x]), do: x
  defp do_sum([head | tail]), do: head + do_sum(tail)

  def summer(xs), do: do_summer(xs, 0)
  defp do_summer([], ans), do: ans
  defp do_summer([head | tail], ans), do: do_summer(tail, ans + head)

  def double(xs, fun) when is_list(xs), do: do_double(xs, [], fun)
  defp do_double([], xxs, _fun), do: xxs
  defp do_double([head | tail], xxs, fun) do
    head = fun.(head)
    xxs = xxs ++ [head]
    do_double(tail, xxs, fun)
  end
end

#sum = &(&1 + &2)
#IO.inspect(sum.(10,11))
#IO.inspect(Math.double([1, 2, 3], &(&1 + 1)))
#IO.inspect(Enum.map([1, 2, 3, 4], fn x -> x * 2 end))
