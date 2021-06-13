defmodule Election do
  import Candidate

  defstruct(
    name: "Major",
    candidates: [
      Candidate.new(1, "Some"),
      Candidate.new(2, "Some2"),
    ],
    next_id: 2
  )

  def update(election, {"n", name}) when is_binary(name) do
    Map.put(election, :name, name)
  end

  def update(election, {"a", candidate_name}) when is_binary(candidate_name) do
    id = election.next_id + 1
    candidate = Candidate.new(id, candidate_name)
    candidates = [election.candidates, [candidate]]
                 |> Enum.flat_map(&(&1))
    %Election{election | candidates: candidates, next_id: id}
  end

  def update(election, {"v", id}) when is_integer(id) do
    election.candidates
    |> Enum.map(&maybe_update_candidate(&1, id))
  end

  defp maybe_update_candidate(%Candidate{id: c_id} = candidate, id) when c_id == id do
    %Candidate{candidate | votes: candidate.votes + 1}
  end
  defp maybe_update_candidate(candidate, _id), do: candidate
end