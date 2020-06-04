defmodule Counter.Core do
  def new() do
    0
  end

  def increment(number) do
    number + 1
  end

  def decrement(number) do
    number - 1
  end
end
