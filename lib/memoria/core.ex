defmodule Memoria.Core do
  defstruct [
    text:       "",
    schedule:   [],
  ]

  def new_memoria(text, number_of_steps, test \\ false) do
    #constructor
    %__MODULE__ {
    text:       text,
    schedule:   build_schedule(text, number_of_steps, test),
  }
  end

  def erase(%{ schedule: [step|new_schedule], text: text}) do
    #reducer
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

  #helpers
  defp maybe_delete(" ", true), do: " "
  defp maybe_delete(_character, true), do: "-"
  defp maybe_delete(character, false), do: character
  defp maybe_shuffle(list, true), do: list
  defp maybe_shuffle(list, false), do: Enum.shuffle(list)
  defp build_schedule(text, number_of_steps, test) do
    #helper
    step_size =
      text
      |> String.length
      |> Kernel./(number_of_steps)
      |> ceil

    (1..String.length(text))
    |> maybe_shuffle(test)
    |> Enum.chunk_every(step_size)
  end

end
