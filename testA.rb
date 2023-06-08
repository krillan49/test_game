def character_panel(c)
  puts '--------------------------------------------------------------------------------------------'
  puts '--------------------------------------------------------------------------------------------'
  # puts c.name
  puts "Уровень #{c.lvl} (#{c.exp})"
  # puts "Н А В Ы К И:"
  # puts "[акт] #{@name_special_pl} #{@lor_special_pl}"
  # puts "[пас] #{@name_passive_pl} #{@lor_passive_pl}"
  # puts "[неб] #{@name_noncombat_pl} #{@lor_noncombat_pl}"
  puts "С Т А Т Ы:"
  puts "strength - #{c.strength}\nconstitution - #{c.constitution}\ndexterity - #{c.dexterity}\nperception - #{c.perception}\nintelligence - #{c.intelligence}\ncharisma - #{c.charisma}"
  puts "Х А Р А К Т Е Р И С Т И К И:"
  puts "HP #{c.hp}/#{c.max_hp} Реген #{c.regen_hp} Восстановление #{c.recovery_hp}"
  puts "MP #{c.sp}/#{c.max_sp} Реген #{c.regen_sp} Восстановление #{c.recovery_sp}"
  puts "initiative - #{c.initiative} accuracy - #{c.accuracy} evasion - #{c.evasion} max_weight - #{c.max_weight} skill_points_up - #{c.skill_points_up}"
  # puts "Урон #{char.mindam}-#{char.maxdam} (базовый #{char.mindam}-#{char.maxdam} + #{@weapon} #{@mindam_weapon}-#{@maxdam_weapon})"
  # puts "Броня #{char.armor} (базовая #{char.armor} + #{@torso} #{@armor_torso} + #{@helmet} #{@armor_helmet} + #{@gloves} #{@armor_gloves} + #{@shield} #{@armor_shield})"
  # puts "Шанс блока #{} (#{@shield} #{@block_shield}) блокируемый урон #{100 - (100 / (1 + char.hp.to_f / 200)).to_i}%"
  puts "С В О Б О Д Н Ы Е  С Т А Т Ы:"
  puts "stat_points #{c.stat_points}"
  puts '--------------------------------------------------------------------------------------------'
  puts '--------------------------------------------------------------------------------------------'
end


# рандомное автораспределение статов
def stats_randomizer(char)
  char.restart_influence_of_stats
  character_panel(char)

  stats = char.up_stats_chances
  res = []
  30.times{ res << stats.sample}
  res.tally.each do |k,v|
    old = char.send(k)
    char.send("#{k}=", old + v)
  end

  char.restart_influence_of_stats
  character_panel(char)
end


# полурандомный распределитель статов для ручнной прокачки
def stats_half_randomizer(char)
  stats = char.up_stats_chances

  until char.stat_points == 0
    char.restart_influence_of_stats
    character_panel(char)

    res1, res2 = stats.sample, stats.sample
    choode_stat = 0
    begin
      puts "выберите какой стат прибавить.\n#{res1} - нажмите 1; #{res2} - нажмите 2;"
      choose_stat = gets.strip.to_i
      if %w[1 2].include?(choose_stat.to_s)
        puts "вы выбрали вариант #{choose_stat}"
      else
        puts "вы ввели неверный символ"
      end
    end until %w[1 2].include?(choose_stat.to_s)
    res = [res1, res2][choose_stat - 1]

    old = char.send(res) # 5
    char.send("#{res}=", 1 + old) # 6
    char.stat_points -= 1
  end

  char.restart_influence_of_stats
  character_panel(char)
end


class Character
  attr_accessor :strength, :constitution, :dexterity, :perception, :intelligence, :charisma # первичные статы
  attr_accessor :stat_points, :skil_points, :exp, :lvl
  attr_accessor :max_hp, :regen_hp, :recovery_hp, :max_sp, :regen_sp, :recovery_sp, :initiative, :accuracy, :evasion, :max_weight, :skill_points_up # вторичные характеристики
  attr_accessor :hp, :sp # актуальные значения
  attr_accessor :mindam, :maxdam, :armor, :exp_lvl, :name

  def initialize
    @strength = 5 # сила
    @constitution = 5 # телосложение
    @dexterity = 5  # ловкость
    @perception = 5 # восприятие
    @intelligence = 5 # интеллект
    @charisma = 5 # харизма

    @stat_points = 30
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

  # ================== XZ =====================
  # def plus_damage(n)
  #   @mindam == @maxdam ? @maxdam += n : [@mindam, @maxdam][rand(1)] += n
  # end
  #
  # def plus_exp_and_level_up(n)
  #   @exp += n
  #   new_lvl = @exp_lvl.index{|e| e.include?(@exp)} - @lvl # ???
  #   @lvl += new_lvl
  #   @points += new_lvl
  #   @skil_points += new_lvl
  # end
  #
  # def name_change(name)
  #   @name = name
  # end
end

class Orc < Character
  def initialize
    super
    @strength = 7
    @constitution = 7
    @perception = 4
    @intelligence = 3
    @charisma = 4
  end

  def up_stats_chances
    [:strength]*5 + [:constitution]*5 + [:dexterity]*3 + [:perception]*2 + [:intelligence] + [:charisma]*2
  end
end

# char = Orc.new
char = Character.new
# stats_half_randomizer(char)
stats_randomizer(char)
