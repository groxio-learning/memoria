defmodule Memoria.Boundary do
 use GenServer

 alias Memoria.Core

 def init({text, step}) do
   {:ok, Core.new_memoria(text, step)}
 end
end
