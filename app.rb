def character_panel(char)
  puts '--------------------------------------------------------------------------------------------'
  puts '--------------------------------------------------------------------------------------------'
  puts char.name
  puts "Уровень #{char.lvl} (#{char.exp}/#{char.exp_lvl[char.lvl + 1].min})"
  puts "Н А В Ы К И:"
  puts "[акт] #{@name_special_pl} #{@lor_special_pl}"
  puts "[пас] #{@name_passive_pl} #{@lor_passive_pl}"
  puts "[неб] #{@name_noncombat_pl} #{@lor_noncombat_pl}"
  puts "С Т А Т Ы:"
  puts "HP #{char.hp.round}/#{char.max_hp} Реген #{char.regen_hp} Восстановление #{char.recovery_hp.round}"
  puts "MP #{char.mp.round}/#{char.max_mp} Реген #{char.regen_mp} Восстановление #{char.recovery_mp.round}"
  puts "Урон #{char.mindam}-#{char.maxdam} (базовый #{char.mindam}-#{char.maxdam} + #{@weapon} #{@mindam_weapon}-#{@maxdam_weapon})"
  puts "Точность #{char.accuracy} (базовая #{char.accuracy} + #{@gloves} #{@accuracy_gloves})"
  puts "Броня #{char.armor} (базовая #{char.armor} + #{@torso} #{@armor_torso} + #{@helmet} #{@armor_helmet} + #{@gloves} #{@armor_gloves} + #{@shield} #{@armor_shield})"
  puts "Шанс блока #{} (#{@shield} #{@block_shield}) блокируемый урон #{100 - (100 / (1 + char.hp.to_f / 200)).to_i}%"
  puts '--------------------------------------------------------------------------------------------'
  puts '--------------------------------------------------------------------------------------------'
end

class Character
  attr_reader :name
  attr_reader :max_hp, :hp, :regen_hp, :recovery_hp, :max_mp, :mp, :regen_mp, :recovery_mp
  attr_reader :mindam, :maxdam, :accuracy, :armor, :exp, :lvl, :points, :skil_points, :exp_lvl

  def initialize
    @name = 'No name'

    @max_hp = 100
    @hp = 100
    @regen_hp = 0
    @recovery_hp = @max_hp * 0.1

    @max_mp = 100
    @mp = 100
    @regen_mp = 0
    @recovery_mp = @max_mp * 0.1

    @mindam = 5
    @maxdam = 5
    @accuracy = 80
    @armor = 0

    @exp = 0
    @lvl = 0
    @points = 5
    @skil_points = 0

    @exp_lvl = [0..1, 2..4, 5..8, 9..13, 14..19, 20..26, 27..34, 35..43, 44..53, 54..64, 65..76, 77..89, 90..103, 104..999]
  end

  def full_points
    @hp = @max_hp
    @mp = @max_mp
  end

  def name_change(name)
    @name = name
  end

  def plus_hp(n)
    @max_hp += n
  end

  def plus_mp(n)
    @max_mp += n
  end

  def plus_damage(n)
    @mindam == @maxdam ? @maxdam += n : [@mindam, @maxdam][rand(1)] += n
  end

  def plus_exp_and_level_up(n)
    @exp += n
    new_lvl = @exp_lvl.index{|e| e.include?(@exp)} - @lvl # ???
    @lvl += new_lvl
    @points += new_lvl
    @skil_points += new_lvl
  end

  def points_converter(n)

  end
end

char = Character.new
char.name_change('Vasyan')

loop do
  character_panel(char)
  char.plus_exp_and_level_up(4)
  gets
end
