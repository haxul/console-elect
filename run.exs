voting_machine_ips = [
  "10.1.1",
  "10.1.2",
  "10.1.3",
  "10.1.4",
  "10.1.5",
  "10.1.6",
  "10.1.7",
  "10.1.8"
]

simulate_api_call = fn _ip ->
  votes = Enum.random(225..275)
  :timer.sleep(votes)
  votes
end


defmodule Worker do
  def start(fun) do
    pid = self()
    spawn(fn -> send(pid, {self(), fun.()}) end)
  end

  def wait(pid) do

  end
end

voting_machine_ips
|> Enum.map(
     fn ip ->
       Worker.start(fn -> simulate_api_call.(ip)  end)
     end
   )
|> IO.inspect
|> Enum.map(
     fn
       _pid ->
         receive do
           {pid, result} -> {pid, result}
         end
     end
   )
|>
