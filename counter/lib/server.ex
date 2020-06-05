defmodule Counter.Server do
  use GenServer
  alias Counter.Core

  def start_link( initial_state) do
    GenServer.start_link(__MODULE__, initial_state)
  end

  def init(initial_state) do
    {:ok, initial_state}
  end

  def handle_call(:count, _from, count) do
    {:reply, count, count}
  end

  def handle_cast(:increment, count) do
    {:noreply, Core.increment(count)}
  end

  def handle_cast(:decrement, count) do
    {:noreply, Core.decrement(count)}
  end

  def handle_cast(:clear, _count) do
    {:noreply, Core.new()}
  end

end
