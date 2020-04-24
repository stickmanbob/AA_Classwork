require "byebug"

class ComputerPlayer
  def initialize
    @known_cards = Hash.new {|h,k| h[k] = []}
    @matched_cards = []
    @previous_guess = nil
  end
  
  def receive_revealed_card(pos, value)
    @known_cards[value] << pos if @known_cards[value].length<2
    @previous_guess = value
  end

  def receive_match(match_1, match_2)
    @matched_cards.push(match_1, match_2)
  end

  def get_random
    done = false
    until done
      done = true
      row, col = rand(0..3), rand(0..3)
      guess =  [row,col]
      @known_cards.values.each do |positions| 
        if positions.include?(guess)
          done = false
        end
      end
    end
    # debugger
    guess
  end
  
  def get_first_guess
    # debugger
      @known_cards.each do |value,positions|
        if positions.length == 2 && positions.none?{|pos| @matched_cards.include?(pos)}
          return positions[1]
        
        end
      end
      
    return get_random
  end

  def get_second_guess
    # debugger
    if @known_cards[@previous_guess].length == 2
      return @known_cards[@previous_guess][0]
    else
      return get_random
    end
    
  end


end