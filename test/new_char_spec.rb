require '../app'

# Изначальные + свободные статы до распределения
stat_count = [:strength, :constitution, :dexterity, :perception, :intelligence, :charisma, :stat_points].map{|s| Character.new.send(s)}.sum

[Human, Orc, Elf, DarkElf, Dwarf].each do |char_class|

  describe char_class do

    it "free stats mast be zero" do
      # arrange
      char = char_class.new
      # act - рандомное распределение статов
      stats_randomizer(char)
      # assert
      expect(char.stat_points).to eq 0
    end

    it "must return #{stat_count} stats" do
      # arrange
      char = char_class.new
      # act - рандомное распределение статов
      stats_randomizer(char)
      char_stats_count = [:strength, :constitution, :dexterity, :perception, :intelligence, :charisma].map{|s| char.send(s)}.sum
      # assert
      expect(char_stats_count).to eq stat_count
    end

  end

end
