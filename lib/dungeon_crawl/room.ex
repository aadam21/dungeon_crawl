defmodule DungeonCrawl.Room do
  @moduledoc """
    Module for a Room struct that has a description of a room in the dungeon
    and available actions. Action functions are imported from *.Action
  """
  alias DungeonCrawl.Room
  alias DungeonCrawl.Room.Triggers

  import DungeonCrawl.Room.Action

  defstruct [description: nil, actions: [], trigger: nil]

  @doc """
    List all available rooms
  """
  def all, do: [
    %Room{
      description: "You can see the light of day. You found the exit!",
      actions: [forward()],
      trigger: Triggers.Exit
    },
    %Room{
      description: "You can see an enemy blocking your path.",
      actions: [forward()],
      trigger: Triggers.Enemy
    }
  ]
end
