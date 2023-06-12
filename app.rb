require_relative "panels.rb"
include Panels
require_relative "stats_randomazers.rb"
include StatsRandomazers
require_relative "characters.rb"
include Characters

# char = [Human.new, Orc.new, Elf.new, DarkElf.new, Dwarf.new][3]
# stats_half_randomizer(char)
# stats_randomizer(char)


# Распределение статов пати
party = CharsParty.new(3)
party.chars.each do |id, char|
  p '='*40
  p ' '*15 + "#{id}"
  p '='*40
  stats_randomizer(char)
end
