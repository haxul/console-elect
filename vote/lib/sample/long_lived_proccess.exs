defmodule Counter do
  #Public
  def start(count) when is_integer(count), do: spawn_link(Counter, :run, [count])
  def count(pid) when is_pid(pid) do
    send(pid, {:get, self()})
    receive do
      count -> count
    end
  end
  def increment(pid) when is_pid(pid), do: send(pid, :increment)
  def decrement(pid) when is_pid(pid), do: send(pid, :decrement)

  #Internal Impl
  def run(count) do
    :timer.sleep(100)
    receive do
      :increment -> count + 1
      :decrement -> count - 1
      {:get, pid} -> send(pid, count)
      _msg -> count
    end
    |> run
  end
end


pid = Counter.start(100)
Counter.decrement(pid)
Counter.decrement(pid)
Counter.decrement(pid)
counter = Counter.count(pid)

IO.inspect(counter)
IO.inspect("done")


