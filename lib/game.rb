require_relative 'player.rb'
class  Game
  attr_accessor :humaun_player,:enemies

  def initialize(name)
    @enemies = []
    @enemies << Player.new("josé")
    @enemies << Player.new("josiane")
    @enemies << Player.new("mark")
    @enemies << Player.new("jordan")
    @humaun_player =  HumanPlayer.new(name)
  end 

  def kill_player(player)
      @enemies.delete(player)
      return player
  end

  def is_still_ongoing?
    if @humaun_player.lifepoints<=0 || @enemies.length == 0
      return false
    else 
      return true
    end
  end

  def show_players
    puts "il vous autant de  #{@humaun_player.lifepoints} de points de vie"
    puts  "il reste #{@enemies.length} boot"
  end

  def menu() 
    puts "quels action veux-tu effectuer"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "\n \n"
    puts "attaquer un joueur en vue " 
  @enemies.each_with_index do |enemy, index|
    next if enemy.lifepoints <= 0
    puts "#{index} - #{enemy.name} a #{enemy.lifepoints} points de vie"
  end
  puts "\n"
  choice = gets.chomp
  limited_choice = /^[as0-#{@enemies.length - 1}]/

  return choice if choice.length == 1 && choice =~ limited_choice
  puts '*******# ERREUR MAUVAISE SAISIE #******* '
  false
  end
  def menu_choice(choice)
    case choice
    when "a"
      @humaun_player.search_weapon
    when "s"
      @humaun_player.search_health_pack
    when "0"
       @enemies[0].lifepoints-=@humaun_player.compute_damage
      if  @enemies[0].lifepoints<=0
        kill_player(@enemies[0])
      end
    when  "1"
      @enemies[1].lifepoints-=@humaun_player.compute_damage
      if @enemies[1].lifepoints<=0
        kill_player(@enemies[1])
      
      end
      
    when "2"
      @enemies[2].lifepoints-=@humaun_player.compute_damage
      if @enemies[2].lifepoints<=0
        kill_player(@enemies[2])
      
      end
  when "3"
    @enemies[3].lifepoints-=@humaun_player.compute_damage
    if @enemies[3].lifepoints<=0
      kill_player(@enemies[3])
    end
  end  
end
def enemies_attack()
  @enemies.each do |ennemis| 
    ennemis.attacks(@humaun_player)
    puts @humaun_player.lifepoints
  end
end
  def end
    puts "le jeu est fini"
  end  
end

#  my_game = Game.new("wolferine")
# # my_game.kill_player(my_game.enemies[0])
# puts choice=my_game.menu()
# # my_game.menu_choice(choice)
