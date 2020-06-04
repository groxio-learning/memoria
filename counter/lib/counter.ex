defmodule Counter do
  def start() do
    Counter.Boundary.start(Counter.Core.new())
  end

  def increment(counter) do
    send(counter, :increment)
  end

  @spec decrement(atom | pid | port | {atom, atom}) :: any
  def decrement(counter) do
    send(counter, :decrement)
  end

  def count(counter) do
    send(counter, {self(), :count})

    receive do
      message ->
        message
    end
  end
end
