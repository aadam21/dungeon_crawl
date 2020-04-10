defmodule DungeonCrawl.Room.Trigger do
  alias DungeonCrawl.Character
  alias DungeonCrawl.Room.Action

  # Directive that specifies any module using this must have a run/2 with the
  # 2 args being `character` and `action`, which can both be any type. The
  # return will also be any type
  @callback run(Character.t(), Action.t()) :: {Character.t(), atom}
end
