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
    current = election.candidates
              |> Enum.find(:error, fn candidate -> candidate.id == id end)
    do_update_candidates(election.candidates, current)
  end

  defp do_update_candidates(candidates, :error), do: candidates

  defp do_update_candidates(candidates, candidate) do
    updated_candidate = %Candidate{candidate | votes: candidate.votes + 1}
    candidates
    |> Enum.reject(fn c -> c.id == updated_candidate.id end)
    |> (fn candidates, updated -> [updated | candidates] end).(updated_candidate)
  end
end