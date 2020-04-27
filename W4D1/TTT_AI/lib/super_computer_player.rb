require_relative 'tic_tac_toe_node'
require "byebug"
class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
     if mark == :x
            nmm = :o 
      else
            nmm = :x
      end
    node = TicTacToeNode.new(game.board , mark)
    children = node.children
    
    next_move = children.find do |child| 
      # debugger
      child.winning_node?(mark) && !child.losing_node?(mark)

        
    end

    return next_move.prev_move_pos if next_move
    p "hello"
     next_move = children.find do |child|
      
      child if !child.losing_node?(mark)
      
    end
    return next_move.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new
  
  TicTacToe.new(hp, cp).run
end
