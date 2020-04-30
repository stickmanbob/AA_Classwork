require_relative "piece"

class Pawn < Piece 

    def symbol
        @color == :white ? "♟" : "♙"
    end

    def move_dirs
        forward_steps + side_attacks
    end

    def at_start_row?
        return true if @color == :black and @pos[0] == 1
        return true if @color == :white and @pos[0] == 6
        false 
    end

    def forward_dir 
        @color == :white ? -1 : 1
    end

    def forward_steps
        if at_start_row?
            moves =  [[@pos[0] + forward_dir, @pos[1]], [@pos[0] + forward_dir*2, @pos[1]]]
        else
            moves =  [[@pos[0] + forward_dir, @pos[1]]]
        end
        valid_moves = []

        moves.each do |step|
            if @board.valid_pos?(step) && @board[step].empty?
                valid_moves << step
            else
                break
            end
        end
        valid_moves
    end

    def side_attacks
        enemy_color = @color == :white ? :black : :white
        attacks = [[@pos[0] + forward_dir, @pos[1] - 1],[@pos[0] + forward_dir, @pos[1] + 1]]
        attacks.select {|attack| @board.valid_pos?(attack) && @board[attack].color == enemy_color }
    end
end