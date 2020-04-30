require_relative "piece.rb"
require_relative "slideable.rb"

class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def symbol
        color == :white ? "♝" : "♗"
    end

    def move_dirs
        diagonal_dirs
    end
end