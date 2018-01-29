require_relative ('environment.rb')


class Lightsaber
  attr_accessor :color, :owner

def initialize(color)
  @color = color
  @sounds = ["bzz","zzz","zz","bbbbbzzzzz","zzzzz","zz-zz","z-zzz"]
  @owner = owner
end

def attack(enemy)
  puts "sparks!!"
  @sounds.sample
  self.owner.strike_count += 1
  if self.owner.strike_count == 10
    self.owner.level += 1
    puts "#{self.owner.name} has leveled up! Welcome to Level 2."
    elsif self.owner.strike_count == 20
    self.owner.level += 1
    puts "#{self.owner.name} has leveled up! Welcome to Level 3."
  end
    enemy.health -= 50
    if enemy.health < 1
      puts "Your enemy has died."
  end
end

def defend
  puts "sparks!!"
  @sounds.sample
  self.owner.strike_count += 1
  if self.owner.strike_count == 10
    self.owner.level += 1
    puts "#{self.owner.name} has leveled up! Welcome to Level 2."
    elsif self.owner.strike_count == 20
    self.owner.level += 1
    puts "#{self.owner.name} has leveled up! Welcome to Level 3."
  end
end
end
