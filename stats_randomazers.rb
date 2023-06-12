module StatsRandomazers

  # рандомное автораспределение статов
  def stats_randomizer(char)
    # char.restart_influence_of_stats  # ----------------
    # Panels.character_panel(char)  # ------------------

    stats = char.up_stats_chances
    res = []
    until char.stat_points == 0
      res << stats.sample
      char.stat_points -= 1
    end
    res.tally.each do |k,v|
      old = char.send(k)
      char.send("#{k}=", old + v)
    end

    char.restart_influence_of_stats
    Panels.character_panel(char)
  end


  # полурандомный распределитель статов для ручнной прокачки
  def stats_half_randomizer(char)
    stats = char.up_stats_chances

    until char.stat_points == 0
      char.restart_influence_of_stats
      Panels.character_panel(char)

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
    Panels.character_panel(char)
  end

end
