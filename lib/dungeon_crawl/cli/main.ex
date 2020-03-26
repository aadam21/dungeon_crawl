defmodule DungeonCrawl.CLI.Main do
  alias Mix.Shell.IO, as: Shell

  def start_game do
    welcome_message()
    Shell.prompt("Press Enter to continue")

    crawl(hero_choice(), DungeonCrawl.Room.all())
  end

  defp welcome_message do
    Shell.info("=== Dungeon Crawl ===")
    Shell.info("You awake in a dungeon full of monsters.")
    Shell.info("You need to survive and find the exit.")
  end

  defp hero_choice do
    DungeonCrawl.CLI.HeroChoice.start()
  end

  defp crawl(character, rooms) do
    Shell.info("You keep moving forward to the next room.")
    Shell.prompt("Press Enter to continue")
    Shell.cmd("clear")

    rooms
    |> Enum.random
    |> DungeonCrawl.CLI.RoomActionsChoice.start
    |> trigger_action(character)
    |> handle_action_result
  end

  # Clear the screen can call run/2 from the module stored in `trigger` attr
  defp trigger_action({room, action}, character) do
    Shell.cmd("clear")
    room.trigger.run(character, action)
  end

  # Finish the game when result is :exit, otherwise recursively call crawl/2
  # with the hero and rooms
  defp handle_action_result({_, :exit}),
       do: Shell.info("You found the exit. You wont the game. Congratulations!")
  defp handle_action_result({character, _}),
       do: crawl(character, DungeonCrawl.Room.all())
end
