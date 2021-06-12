import Integer, only: [is_even: 1]

list1 = [1, 2, 3, 4]
list2 = [5, 6, 7, 8]


#list3 =
#  list1
#  |> Enum.filter(&is_even/1)
#  |> Enum.flat_map(
#       fn x ->
#         list2
#         |> Enum.filter(&is_even/1)
#         |> Enum.map((&(&1 * x)))
#       end
#     )
#
#list1
#|> Enum.map(
#     fn x ->
#       list2
#       |> Enum.map(
#            fn y ->
#              IO.inspect("(#{x} #{y})")
#            end
#          )
#     end
#   )
#comprehensions
#
#for x = 1 <- [1, 2, 3]  do
#  for y <- [4, 5, 6], is_even(y) do
#    IO.inspect("#{x}, #{y}")
#  end
#end

defprotocol Calculable do
  def sum(data)
end

defimpl Calculable, for: List do
  def sum(list), do: do_sum(list, 0)
  defp do_sum([], ans), do: ans
  defp do_sum([head | tail], ans), do: do_sum(tail, head + ans)
end

defimpl Calculable, for: Tuple do
  def sum(list), do: list |> Tuple.to_list |> Calculable.sum
end

IO.inspect(Calculable.sum({1, 2, 3}))