require_relative ('environment.rb')


class Being
  @@sith_names = ["Darth Vader", "Kylo Ren", "Darth Maul", "Count Dooku", "Darth Quid"]
  @@stormtrooper_names = ["bob123","yoyo9","FN1987"]
  @@droid_names = ["R2-D5","BB-18","C-2T0"]


  def walk
    puts "You began to walk across the planet."
    puts "You happened upon an enemy."
    enemy_possiblity = ["sith","stormtrooper","stormtrooper"]
    bad_guy = enemy_possiblity.sample.downcase
    puts "Your enemy is a #{bad_guy}."
    puts "TIME TO FIGHT!"
    puts "Are you ready to fight?"
    yes_or_no = gets.strip.downcase
    if yes_or_no == "yes"
      self.current_enemy = bad_guy
      self.fight
    else
      puts "Chicken! You hid behind some nearby rocks. I have a bad feeling about this."
    end
    puts "Do you want to continue to walk? Yes or no?"
    input = gets.strip.downcase
    if input == "yes"
      self.walk
    end
  end

  def fight
    if self.current_enemy == "sith"
      puts "Oh crap! A Sith."
      current_enemy = Sith.new("#{@@sith_names.sample}")
      current_enemy_saber = Lightsaber.new("red")
      puts "It's #{current_enemy.name}!"
      current_enemy.give_saber(current_enemy_saber)
      puts "He has a #{current_enemy_saber.color} lightsaber!"
      until self.health < 1 || current_enemy.health < 1
        current_enemy.lightsaber.attack(self)
        puts "You've been attacked. The enemy's strike did 50 damage."
        puts "Your current health is #{self.health}."
        puts "Now it's your turn to attack!"
        puts "Which move do you want to use? Lightsaber or Force?"
        attack_type = gets.strip.downcase
        if attack_type == "lightsaber"
          self.lightsaber.attack(current_enemy)
        elsif attack_type == "force"
          self.force_push(current_enemy)
        end
      end

    elsif self.current_enemy == "stormtrooper"
      puts "No problem. Just a stormtrooper."
      new_enemy = Stormtrooper.new("#{@@stormtrooper_names.sample}")
      self.current_enemy = new_enemy
        until self.health < 1 || new_enemy.health < 1
        new_enemy.shoot(self)
        self.lightsaber.attack(new_enemy)
        end
      end
    end
  end


  class Jedi < Being
  attr_accessor :name, :lightsaber, :level, :strike_count, :health, :current_enemy, :type

    def initialize(name)
      @name = name
      @lightsaber
      @level = 1
      @strike_count = 0
      @health = 100
      @current_enemy = current_enemy
      @type = "jedi"
    end

    def give_saber(lightsaber)
      self.lightsaber = lightsaber
      lightsaber.owner = self
    end

    def force_push(enemy)
      puts "You force pushed the enemy!"
      self.strike_count += 1
      if self.strike_count == 10
        self.level += 1
        puts "#{self.name} has leveled up! Welcome to Level 2."
      elsif self.strike_count == 20
        self.level += 1
        puts "#{self.name} has leveled up! Welcome to Level 3."
      end
        enemy.health -= 30
        if enemy.health < 1
          puts "Your enemy has died."
      end
    end
  end


  class Sith < Being
    attr_accessor :name, :lightsaber, :level, :strike_count, :health, :current_enemy

    def initialize(name)
      @name = name
      @lightsaber
      @level = 1
      @strike_count = 0
      @health = 100
      @current_enemy = current_enemy
      @type = "sith"
    end

    def give_saber(lightsaber)
      self.lightsaber = lightsaber
      lightsaber.owner = self
    end
  end


  class Stormtrooper
    attr_accessor :name, :health, :blaster, :current_enemy
    @@hit_or_miss = ["hit","miss","miss"]

    def initialize(name)
      @name = name
      @health = 20
      @blaster = blaster
      @current_enemy = current_enemy
      @type = "stormtrooper"
    end

    def shoot(current_enemy)
      hit_chance = @@hit_or_miss.sample
      if hit_chance == "hit"
        current_enemy.health -= 10
        puts "Nailed it! #{current_enemy.name}'s health is now #{current_enemy.health}."
      else
        puts "Shucks. Missed. Hope the boss doesn't find out."
      end
    end
end
