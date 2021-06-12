defmodule Party do

  def logo(party, size \\ :medium )

  def logo(party, size) do
    party_mascot = mascot(party)
    do_logo(party_mascot, size)
  end

  defp mascot(:democratic), do: "donkey"
  defp mascot(:republic), do: "elephant"
  defp mascot(:green), do: "plant"
  defp mascot(_), do: :error

  defp do_logo(:error, _), do: "incorrect party"
  defp do_logo(mascot, :small), do: "#{mascot}_small.png"
  defp do_logo(mascot, :medium), do: "#{mascot}_medium.png"
  defp do_logo(mascot, :large), do: "#{mascot}_large.png"
  defp do_logo(mascot, _), do: "incorrect size"
end


IO.inspect(Party.logo(:green, :small))
IO.inspect(Party.logo(:greenn, :small))
IO.inspect(Party.logo(:green, :smalll))
IO.inspect(Party.logo(:green))