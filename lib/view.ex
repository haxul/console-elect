defmodule View do

  def view_header(election) do
    header = """
    ---- Big election day --\n
    Name: #{election.name}  \n
    Candidates: \n
    """
  end

  def view_body(election) do
    election.candidates
    |> Enum.sort(&(&1.votes >= &2.votes))
    |> Enum.map(
         fn candidate ->
           "#{candidate.id}\t#{candidate.name}\t#{candidate.votes}"
         end
       )
    |> add_pre_body
    |> add_footer
    |> Enum.flat_map(&(&1))
    |> Enum.join("\n")

  end

  defp add_pre_body(candidates) do
    ["Id\tName\tVotes", "------------------------" | candidates]
  end

  defp add_footer(candidates) do
    [candidates, ["", "commands: (n)ame <election>, (a)dd <candidate>, (v)ote <id>, (q)uit"]]
  end

end