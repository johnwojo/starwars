require_relative ('environment.rb')


class CommandLineInterface
  attr_accessor :hero

  def initialize
    @hero = hero
  end
  
  def run
    welcome
    give_weapon
    journey
    goodbye
  end

  def welcome
    puts "Hey there. What is your name?"
    input = gets.strip
    puts "Hello, #{input}. Welcome to a galaxy far, far away."
    puts "Time to fulfill your destiny. Are you a Jedi or a Sith?"
    jedi_or_sith = gets.strip.downcase

    if jedi_or_sith == "jedi"
      self.hero = Jedi.new("#{input}")
    elsif jedi_or_sith == "sith"
      self.hero = Sith.new("#{input}")
    else
      puts "You are a mysterious creature."
      self.welcome
    end
    puts "Oooh. You are a #{jedi_or_sith.upcase}!!!"
  end

  def give_weapon
    puts "What color lightsaber do you want?"
    input = gets.strip
    saber = Lightsaber.new(input)
    self.hero.give_saber(saber)
  end

  def journey
    puts "Do you want to go on a journey?"
    input = gets.strip.downcase
    if input == "yes" || input == "y"
      chapter1 = Journey.new("chapter1",self.hero)
    end
  end

  def goodbye
    puts "Thanks for playing!"
  end
end
