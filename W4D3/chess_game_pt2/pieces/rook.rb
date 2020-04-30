require_relative "piece.rb"
require_relative "slideable.rb"
class Rook < Piece
    include Slideable
    def initialize(color, board, pos)
        super
    end

    def symbol
        color == :white ? "♜" : "♖"
    end

    def move_dirs
        horizontal_dirs
    end

end

# r = Rook.new("w","b","p")