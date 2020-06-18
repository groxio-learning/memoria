defmodule Memoria.Core do
  defstruct [
    text:       "",
    schedule:   [],
  ]

  def new_memoria(text, number_of_steps) do
    %__MODULE__ {
    text:       text,
    schedule:   build_schedule(text, number_of_steps),
  }
  end

  def build_schedule(text, number_of_steps) do
    step_size =
      text
      |> String.length
      |> Kernel./(number_of_steps)
      |> ceil

    (1..String.length(text))
    |> Enum.shuffle
    |> Enum.chunk_every(step_size)
  end

end
