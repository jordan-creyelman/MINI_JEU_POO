class Player
  attr_accessor :name,:lifepoints
  @@all_players =[]

  def initialize(name)
    @name=name
    @lifepoints=10
    @@all_players.push(self)
  end

  def show_state
    puts "#{name} a #{lifepoints} points de vie"
  end

  def gets_damage(damage)
    @lifepoints -= damage
  end

  def attacks(player)
      player.gets_damage(compute_damage)
      puts show_state()
  end

  def compute_damage
    rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @lifepoints=100
    @weapon_level =1
  end
  def show_state
    puts "#{name} a #{lifepoints} points de vie"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    random_weapon=rand(1..6)
    puts "tu as trouver une arme#{random_weapon}"
    if random_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    random_health=rand(1..6)
    if random_health==1
      puts "Tu n'as rien trouvé.."
    elsif random_health > 1 && random_health < 6
      self.lifepoints += 50
      self.lifepoints = 100 if self.lifepoints > 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      self.lifepoints += 80
      self.lifepoints = 100 if self.lifepoints > 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end  

end


