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

  def erase(%{ schedule: [step|new_schedule], text: text}) do
    new_text =
      text
      |> String.graphemes
      |> Enum.with_index(1)
      |> Enum.map(fn {character, index} ->
        maybe_delete(character, index in step)
      end)
      |> Enum.join

      %__MODULE__ {
        text: new_text,
        schedule: new_schedule
      }
  end

  defp maybe_delete(_character, true), do: "_"
  defp maybe_delete(character, false), do: character




end
