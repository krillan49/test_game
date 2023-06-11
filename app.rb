require_relative "panels.rb"
include Panels
require_relative "stats_randomazers.rb"
include StatsRandomazers
require_relative "characters.rb"
include Characters



char = [Human.new, Orc.new, Elf.new, DarkElf.new, Dwarf.new][3]
# StatsRandomazers.stats_half_randomizer(char)
stats_randomizer(char)
