defmodule TsTest do
  use ExUnit.Case
  doctest Ts

  test "greets the world" do
    assert Ts.hello() == :world
  end
end
