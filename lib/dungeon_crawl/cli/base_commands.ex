defmodule DungeonCrawl.CLI.BaseCommands do
  @moduledoc false

  alias Mix.Shell.IO, as: Shell

  @doc """
    Take any list of options and use an index offset of 1 to present choices
    to users
  """
  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  @doc """
    Accept options and present them to users for input. This is intentionally
    generic for reuse
  """
  def generate_question(options) do
    options = Enum.join(1..Enum.count(options), ", ")
    "Which one? [#{options}]\n"
  end

  @doc """
    Parse user answer using the index, but subtract one since the original
    offset for each option's index was 1
  """
  def parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end
end
