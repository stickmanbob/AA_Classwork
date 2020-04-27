require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return true if board.over? && board.winner == next_mover_mark
    return false if board.over? && (board.winner == nil or board.winner == evaluator)
    children = self.children 
    if evaluator == next_mover_mark
      return true if children.all? { |child| child.losing_node?(evaluator)}
    else
      return true if children.any? { |child| child.losing_node?(evaluator)}
    end
    return false
  end

  def winning_node?(evaluator)
    return true if board.over? and board.winner == evaluator
    return false if board.over? and (board.winner == nil or board.winner == next_mover_mark)

    children = self.children 

    if evaluator == next_mover_mark
      return true if children.any? {|child| child.winning_node?(evaluator)}
    else
      return true if children.all? {|child| child.winning_node?(evaluator)}
    end
    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0..2).each do |i|
      (0..2).each do |j|
        if @board.empty?([i,j])
          child_board = @board.dup
          child_board[[i,j]] = @next_mover_mark
          if @next_mover_mark == :x
            mark = :o 
          else
            mark = :x
          end
          children << TicTacToeNode.new(child_board,mark,[i,j] )
        end 
      end
    end
    children
  end

end
