
class HumanPlayer
  def initialize
  end


  def get_first_guess

      puts "Enter first guess in the form of ? ?."
      guess = gets.chomp.split.map(&:to_i)
      # @board.reveal(guess)   
    
  end

  def get_second_guess

      puts "Enter second guess in the form of ? ?."
      guess = gets.chomp.split.map(&:to_i)
      # @board.reveal(guess)   
    
  end

  def receive_revealed_card(pos, value)
    
  end

  def receive_match(match_1, match_2)
   
  end



end