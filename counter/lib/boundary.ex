defmodule Counter.Boundary do
  alias Counter.Core

  def start(initial_state) do
    spawn(fn -> run(initial_state) end)
  end

  def run(state) do
    state |> listen() |> run()
  end

  def listen(state) do
    receive do
      :increment ->
        state |> Core.increment()

      :decrement ->
        state |> Core.decrement()

      :clear ->
        Core.new()

      {from, :count} ->
        send(from, state)
        state
    end
  end
end
