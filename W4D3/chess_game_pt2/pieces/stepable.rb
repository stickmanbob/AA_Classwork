module Stepable
    
    def move_diffs
        raise NoMethodError, "move_diffs required in specific piece class"
    end

    def moves
        valid_moves = []
        move_diffs.each do |dx, dy|
            new_pos = [@pos[0] + dx, @pos[1] + dy]
            valid_moves << new_pos if @board.valid_pos?(new_pos) && (@board[new_pos].empty? || @board[new_pos].color != @color)
        end
        valid_moves
    end

end