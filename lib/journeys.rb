require_relative ('environment.rb')


class Journey
  attr_accessor :hero, :villain, :chapter, :planet

  def initialize(chapter,hero)
    @chapter = chapter
    @hero = hero
    @villain = villain
    @planet = ["Tattoine","Endor","Coruscant"].sample
    puts "Greetings, #{hero.name}."
    puts "You have landed on a planet called #{planet}."
    puts "The planet is inhabited by many enemies."
    puts "You should walk to the capital city."
    self.hero.walk
  end
end
