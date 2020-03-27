defmodule DungeonCrawl.Room.Action do
  @moduledoc """
    Module for defining a struct that's representative of actions a character
    can take
  """
  alias DungeonCrawl.Room.Action

  @type t :: %Action{id: atom, label: String.t}

  defstruct [label: nil, id: nil]

  defimpl String.Chars do
    def to_string(action), do: action.label
  end

  def forward, do: %Action{id: :forward, label: "Move forward."}
  def rest, do: %Action{id: :rest, label: "Take a better look and rest."}
  def search, do: %Action{id: :search, label: "Search the room."}
end
