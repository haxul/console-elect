# anonymous normal function
voter_eligibility = fn (age) ->
  case Integer.parse(age) do
    {age, _} when age < 18 -> "You cannot vote"
    {age, _} when age < 25 -> "You can vote"
    {_age, _} -> "You can but go to an office"
    :error -> "Incorrect age"
  end
end

# named functions
defmodule Voter do
  @moduledoc """
  Functions to work with Voters
  """

  @doc """
  Describes a voters
  ## Parameters
  - age: Integer

  ## Examples

  """

  def voter_elig(age) when is_binary(age) do
    do_voter_elig(age)
  end

  def voter_elig({age, d}) do
    do_voter_elig({age, d})
  end

  def voter_elig(_age) do
    "Invalid age type"
  end

  defp do_voter_elig(:error)  do
    "age is not a number"
  end

  defp do_voter_elig(age) when is_binary(age) do
    voter_elig(Integer.parse(age))
  end

  defp do_voter_elig({age, _}) when is_integer(age) and age < 18 do
    "You cannnot vote"
  end

  defp do_voter_elig({age, _}) when is_integer(age) and age < 25 do
    "You can vote"
  end

  defp do_voter_elig({age, _}) when is_integer(age) do
    "Go to the office"
  end
end

age = IO.gets("Age? ")

message = Voter.voter_elig(age)

IO.puts(message)