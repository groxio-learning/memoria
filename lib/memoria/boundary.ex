defmodule Memoria.Boundary do
  use GenServer
  alias Memoria.Core

  def init({text, step}) do
    {:ok, Core.new_memoria(text, step)}
  end

  def handle_call(:erase, _from, memoria) do
    next_memoria = Core.erase(memoria)
    {:reply, next_memoria.text, next_memoria}
  end

end



#GenServer.call
#:sys.get_state
