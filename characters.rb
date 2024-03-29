module Characters

  class CharsParty
    attr_accessor :size, :chars

    def initialize(n)
      @size = n
      @chars = {}
      1.upto(n) do |x|
        @chars[:"char#{x}"] = [Human.new, Orc.new, Elf.new, DarkElf.new, Dwarf.new].sample
      end
    end

    def stats_randomaze_to_party
      @chars.each do |id, char|
        p '='*40
        p ' '*15 + "#{id}"
        p '='*40
        StatsRandomazers.stats_randomizer(char)
      end
    end
  end

  class Character
    attr_accessor :strength, :constitution, :dexterity, :perception, :intelligence, :charisma # первичные статы
    attr_accessor :stat_points, :skil_points, :exp, :lvl
    attr_accessor :max_hp, :regen_hp, :recovery_hp, :max_sp, :regen_sp, :recovery_sp, :initiative, :accuracy, :evasion, :max_weight, :skill_points_up # вторичные характеристики
    attr_accessor :hp, :sp # актуальные значения
    attr_accessor :mindam, :maxdam, :armor, :exp_lvl
    attr_accessor :name, :race

    def initialize
      @strength = 3 # сила
      @constitution = 3 # телосложение
      @dexterity = 3  # ловкость
      @perception = 3 # восприятие
      @intelligence = 3 # интеллект
      @charisma = 3 # харизма

      @stat_points = 42
      @skil_points = 0
      @exp = 0
      @lvl = 0
    end

    def restart_influence_of_stats
      @max_hp = @constitution * 3 + @strength
      @regen_hp = 0
      @recovery_hp = @constitution # между боями
      @max_sp = @constitution * 2 + @dexterity * 2
      @regen_sp = 0
      @recovery_mp = 0
      @initiative = [@dexterity, @perception].min
      @accuracy = [@dexterity * 10, @perception * 10].min
      @evasion = [@dexterity, @perception * 2].min # уклонение
      @max_weight = @constitution + @strength + @intelligence
      @skill_points_up = @intelligence
    end

    def up_stats_chances
      [:strength, :constitution, :dexterity, :perception, :intelligence, :charisma]
    end
  end

  class Human < Character
    def initialize
      super
      @race = 'Human'
    end
  end

  class Orc < Character
    def initialize
      super
      @race = 'Orc'
    end

    def up_stats_chances
      [:strength]*5 + [:constitution]*5 + [:dexterity]*3 + [:perception]*2 + [:intelligence] + [:charisma]*2
    end
  end

  class Elf < Character
    def initialize
      super
      @race = 'Elf'
    end

    def up_stats_chances
      [:strength]*2 + [:constitution]*2 + [:dexterity]*4 + [:perception]*4 + [:intelligence]*3 + [:charisma]*3
    end
  end

  class DarkElf < Character
    def initialize
      super
      @race = 'Dark Elf'
    end

    def up_stats_chances
      [:strength]*2 + [:constitution]*2 + [:dexterity]*3 + [:perception]*4 + [:intelligence]*4 + [:charisma]*3
    end
  end

  class Dwarf < Character
    def initialize
      super
      @race = 'Dwarf'
    end

    def up_stats_chances
      [:strength]*3 + [:constitution]*5 + [:dexterity]*2 + [:perception]*2 + [:intelligence]*3 + [:charisma]*3
    end
  end

end
