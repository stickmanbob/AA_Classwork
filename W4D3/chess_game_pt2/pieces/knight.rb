require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece
    include Stepable
    def initialize(color, board, pos)
        super
    end

    def symbol
        color == :white ? "♞" : "♘"
    end

    def move_diffs
        [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [-1, 2], [1, -2], [-1, -2]]
    end
end