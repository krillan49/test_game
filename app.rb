require_relative "panels.rb"
include Panels
require_relative "stats_randomazers.rb"
include StatsRandomazers
require_relative "characters.rb"
include Characters

# char = [Human.new, Orc.new, Elf.new, DarkElf.new, Dwarf.new][3]
# stats_half_randomizer(char)
# stats_randomizer(char)


# party = CharsParty.new(3)
# # Распределение статов пати
# party.stats_randomaze_to_party # Characters

class Weapon
  attr_accessor :lvl, :random_min, :random_max
  def initialize(lvl)
    @lvl = lvl
    @random_min = rand(0.5..1)
    @random_max = rand(0.5..1)
  end
end

class Mace
  def damage(char)
    min = char.strength * @random_min
    max = char.strength * 2 * @random_max
  end
end
