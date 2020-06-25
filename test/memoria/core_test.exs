defmodule Memoria.CoreTest do
  use ExUnit.Case
  alias Memoria.Core
  doctest Memoria

  describe "new_memoria/2" do
    test "creates a memoria when given a text and level of difficulty" do
      text = "Long lost loney island"
      level = 5
      memoria = Core.new_memoria(text, level)
      s_length = Kernel.length(memoria.schedule)

      assert memoria.text == text
      assert s_length == level
    end
  end
end
