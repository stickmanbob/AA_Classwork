require "singleton"
# require_relative "rook.rb"

class Piece
    attr_reader :symbol, :board, :color, :pos
    attr_writer :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def empty?
        return true if self == NullPiece.instance
        false
    end

    def valid_moves
        if self.is_a?(Pawn)
            move_dirs.select { |move| !move_into_check?(move) }
        else
            moves.select { |move| !move_into_check?(move) }
        end
    end

    def move_into_check?(end_pos)
        new_board = @board.dup
        new_board.move_piece(@pos, end_pos)
        new_board.in_check?(@color)
    end

    def symbol
        "P"
    end

end

class NullPiece < Piece
    include Singleton

    def initialize(color = nil, board = nil, pos = nil)
        @color = color
        @board = board
        @pos = pos
    end

    def moves
    end

    def symbol
        "-"
    end
end










