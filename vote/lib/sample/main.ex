defmodule Candidate do
  defstruct [:name, :party]
end

defmodule Main do
  #  json = %{
  #    "name" => "serg",
  #    "age" => 33
  #  }
  #
  #  %{"name" => name, "age" => 33} = json
  #
  #  c = %Candidate{name: "serg", party: "demo"}
  #
  #  %Candidate{name: n, party: p} = c
  #  list = [1, 2, 3, 4, 5, 6]
  #  [head | tail]  = list

  message = {:add, [1, 2]}
  {function, [a, b]} = message


end


