require './player'
require './game'

class Question
  attr_reader :answer
  
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end
  
  def ask
    "What is #{@num1} + #{@num2}?"
  end
  
  def verify_answer(answer)
    answer.to_i == @answer
  end
end
