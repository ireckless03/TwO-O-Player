class Player
  attr_reader :name, :score, :life
  
  def initialize(name)
    @name = name
    @life = 3
    @score = 0
  end
  
  def is_wrong
    @life -= 1
    puts "#{name}: Wrong! You lost a life! #{@life}/3"
  end
  
  def is_correct
    @score += 1
    puts "#{name}: Correct! Current score: #{score}"
  end
end
