defmodule DungeonCrawl.CLI.HeroChoice do
  alias Mix.Shell.IO, as: Shell

  def start do
    Shell.cmd("clear")
    Shell.info("Start by choosing your hero:")

    heroes = DungeonCrawl.Heroes.all()
    find_hero_by_index = &Enum.at(heroes, &1)

    heroes
    |> Enum.map(&(&1.name))
    |> display_options
    |> generate_question
    |> Shell.prompt
    |> parse_answer
    |> find_hero_by_index.()
    |> confirm_hero
  end

  def display_options(options) do
    options
    |> Enum.with_index(1)
    |> Enum.each(fn {option, index} ->
      Shell.info("#{index} - #{option}")
    end)

    options
  end

  # Accept the list of heroes generated in display_options/1 and prompt the
  # user for a selection
  defp generate_question(options) do
    options = Enum.join(1..Enum.count(options), ", ")
    "Which one? [#{options}]\n"
  end

  # Parse an integer from user input, representing their hero selection. Since
  # the display_options/1 uses an offset of 1, 1 has to be subtracted after
  # the user selection to match the 0 based list
  defp parse_answer(answer) do
    {option, _} = Integer.parse(answer)
    option - 1
  end

  # Clear the screen and display the description of the chosen hero, prompting
  # the user to confirm their choice. Continue if confirmed, otherwise loop
  # back to start
  defp confirm_hero(chosen_hero) do
    Shell.cmd("clear")
    Shell.info(chosen_hero.description)
    if Shell.yes?("Confirm?"), do: chosen_hero, else: start()
  end
end
