defmodule Counter do
  def start() do
    {:ok, pid} = Counter.Server.start_link(Counter.Core.new())
    pid
  end

  def increment(counter) do
    GenServer.cast counter, :increment
  end

  @spec decrement(atom | pid | port | {atom, atom}) :: any
  def decrement(counter) do
    GenServer.cast counter, :decrement
  end

  def count(counter) do
    GenServer.call counter, :count
  end
end
