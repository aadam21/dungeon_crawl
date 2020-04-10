defmodule DungeonCrawl.Heroes do
  alias DungeonCrawl.Character

  @doc """
    Create a list of Character structs representing each hero type
  """
  def all,
    do: [
      %Character{
        name: "Knight",
        description: "Knight has strong defense and consistent damage",
        hit_points: 18,
        max_hit_points: 18,
        damage_range: 4..5,
        attack_description: "a sword"
      },
      %Character{
        name: "Wizard",
        description: "Wizard has a strong attack, but low health",
        hit_points: 8,
        max_hit_points: 8,
        damage_range: 6..10,
        attack_description: "a fireball"
      },
      %Character{
        name: "Rogue",
        description: "Rogue has a high variability of attack damage",
        hit_points: 12,
        max_hit_points: 12,
        damage_range: 1..12,
        attack_description: "a dagger"
      }
    ]
end
