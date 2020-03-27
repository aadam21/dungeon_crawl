defmodule DungeonCrawl.Room.Triggers.Exit do
  # Specify that this module follows the Room.Trigger contract
  @behaviour DungeonCrawl.Room.Trigger

  @doc """
    run/2 function required by the Room.Trigger callback contract
  """
  def run(character, _), do: {character, :exit}
end
