class Character
  attr_reader :name
  attr_reader :max_hp, :hp, :regen_hp, :recovery_hp, :max_mp, :mp, :regen_mp, :recovery_mp
  attr_reader :mindam, :maxdam, :accuracy, :armor, :exp, :lvl, :points, :skil_points, :exp_lvl

  def initialize
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
end
