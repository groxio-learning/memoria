defmodule Memoria.CoreTest do
  use ExUnit.Case
  alias Memoria.Core
  doctest Memoria

  test "creates a memoria when given a text and level of difficulty" do
    text = "Long lost loney island"
    steps = 5
      memoria = Core.new_memoria(text, steps)
      s_length = Kernel.length(memoria.schedule)

    assert memoria.text == text
    assert s_length == steps
  end

  test "erase composes" do
      Core.new_memoria("abcdef", 3, true)
      |> assert_key(:text, "abcdef")
      |> Core.erase |> assert_key(:text, "__cdef")
      |> Core.erase |> assert_key(:text, "____ef")
      |> Core.erase
      |> assert_key(:text, "______")
  end

  defp assert_key(memoria, key, expected) do
    actual =
      Map.get(memoria, key)

    assert actual == expected

    memoria
  end
end
