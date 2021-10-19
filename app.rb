# require 'bundler'
# Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

# binding.pry
player_position = true 
player = Player.new("josianne")
player1=Player.new("José")
while player.lifepoints>0 && player1.lifepoints >0
     if player_position == true
      player.attacks(player1)
      player_position = false
     else
      player1.attacks(player)
       player_position = true
     end
end

if player_position==false
  puts "#{player.name} à gagner"
else
  puts "#{player1.name} à gagner"  
end
