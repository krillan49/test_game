module Panels

  def character_panel(c)
    puts '--------------------------------------------------------------------------------------------'
    puts '--------------------------------------------------------------------------------------------'
    # puts c.name
    puts "Раса #{c.race}"
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
  
end
