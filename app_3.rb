require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

puts ("-"*49)
puts("|Bienvenue sur 'ILS VEULENT TOUS MA POO !        |")
puts ("|Le but du jeau est d'être le dernier survivant !|")
puts ("-"*49)
puts ("quel est votre speudo")
speudo = gets.chomp
my_game = Game.new(speudo)

human_position = true
while  my_game.is_still_ongoing?
    
  if human_position == true
     puts choice =my_game.menu()
    my_game.menu_choice(choice)
    human_position=false
  else
    my_game.enemies_attack
    human_position=true
  end
 
end
my_game.end