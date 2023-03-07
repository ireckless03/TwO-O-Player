require './player'
require './question'


class Game 
  attr_reader :player1, :player2, :current_player
  
  def start
    puts "Welcome to the game #{player1.name} and #{player2.name}"
    while current_player.life > 0  
    play_turn
    end
  end

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
    @current_player = @player1
  end
  
  def switch_players
    if current_player == player1
      @current_player = player2
    else
      @current_player = player1
    end
  end
  
  def play_turn
    question = Question.new
    puts "#{current_player.name}: #{question.ask}"
    answer = gets.chomp
    if question.verify_answer(answer)
      current_player.is_correct
      switch_players
    else
      current_player.is_wrong
      if current_player.life > 0
        switch_players
      else
       game_over
      end
  end
  
  def game_over
    puts "Game over!"
    if player1.score > player2.score
      puts "#{player1.name} wins with a score of #{player1.score} while #{player2.name} has #{player2.score}"  
    elsif player1.score < player2.score
      puts "#{player2.name} wins with a score of #{player2.score} while #{player1.name} has #{player1.score}"  
    else
      puts "Tie game but unfortunately #{current_player.name} has died of exhaustion"
    end
  end
end
end