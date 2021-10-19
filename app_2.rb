require 'bundler'
# Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

puts ("-"*49)
puts("|Bienvenue sur 'ILS VEULENT TOUS MA POO !        |")
puts ("|Le but du jeau est d'être le dernier survivant !|")
puts ("-"*49)
puts ("quel est votre speudo")
speudo = gets.chomp
humain_position = true
ennemis_position=false
humain =HumanPlayer.new(speudo)
ennemis = [ Player.new("josianne"),Player.new("José")]
while humain.lifepoints>0 && ennemis[0].lifepoints >0 ||ennemis[1].lifepoints>0

  if humain_position == true
    

    puts "quels action veux-tu effectuer"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "\n \n"
    puts "attaquer un joueur en vue :"
    puts "0 - #{ennemis[0].name} a #{ennemis[0].lifepoints} points de vie"
    puts "1 - #{ennemis[1].name} a #{ennemis[1].lifepoints} points de vie"
    choix = gets.chomp
    case choix
    when "a"
      humain.search_weapon
    when "s"
      humain.search_health_pack
    when "0"
      ennemis[0].lifepoints-=humain.compute_damage
      ennemis[0].show_state
    when  "1"
      ennemis[1].lifepoints-=humain.compute_damage
      ennemis[1].show_state
    end
    humain_position=false
  else
    ennemis.each do |ennemis| 
      ennemis.attacks(humain)
      puts humain.lifepoints
      humain_position =true
    end
    
    
      
  end
end
if humain.lifepoints > 0
  puts "winner"
else
  puts "loser"  
end