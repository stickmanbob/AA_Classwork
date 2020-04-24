require_relative "board"
require_relative "human"
require_relative "computer"

class MemoryPuzzle
  def initialize()
    @board = Board.new
    @player = ComputerPlayer.new
    @previous_guess = nil
    @game_over = false
  end
 
  def make_guess(input) #incomplete
    unless @previous_guess
      @previous_guess = input
    else
      if @previous_guess == input
        @previous_guess = nil
        return true
      else
        @previous_guess = nil
        return false
      end
    end

  end

  # def get_guess

  #     puts "Enter a guess in the form of ? ?."
  #     guess = gets.chomp.split.map(&:to_i)
  #     @board.reveal(guess)   
    
  # end
  
  def play
    until @game_over
      #first
      @board.render
      first_guess = false
      until first_guess
        input1 = @player.get_first_guess
        first_guess = @board.reveal(input1)
        
      end
      @player.receive_revealed_card(input1, first_guess)
      make_guess(first_guess)
      #second
      @board.render
      second_guess = false
      until second_guess
        input2 = @player.get_second_guess
        second_guess = @board.reveal(input2) 
        
      end
      @player.receive_revealed_card(input2, second_guess)
      @board.render
      sleep(2)
      if make_guess(second_guess)
        @player.receive_match(input1,input2)
      else
        @board.flip_card(first_guess)
        @board.flip_card(second_guess)
       
      end
      
      @game_over = true if @board.won? 
    end
    print "You won!"
  end


end


p = MemoryPuzzle.new
p.play