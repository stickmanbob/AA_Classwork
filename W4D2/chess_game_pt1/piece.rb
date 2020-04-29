require "singleton"


class Piece
    include Slideable
    attr_reader :symbol, :board, :color
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def inspect
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

    def inspect
        "-"
    end
end



class Knight < Piece
    def initialize(color, board, pos)
        super
        @symbol = :N
    end
end

class King < Piece
    def initialize(color, board, pos)
        super
        @symbol = :K
    end
end

class Rook < Piece
    def initialize(color, board, pos)
        super
        @symbol = :R
    end
end

class Queen < Piece
    def initialize(color, board, pos)
        super
        @symbol = :Q
    end
end

class Bishop < Piece
    def initialize(color, board, pos)
        super
        @symbol = :B
    end
end

module Slideable


    def get_horizontal_dirs
        horizontal_dirs = []
        x, y = @pos
        enemy_color = @color == :white ? :black : :white 
        (0...x).reverse_each do |i|
            if self.board[[i,y]].color == enemy_color 
                horizontal_dirs << [i, y]
                break
            elsif self.board[[i,y]].color == @color 
                break 
            else
                horizontal_dirs << [i, y]
            end
            
        end

        (x + 1...8).each do |i|
            if self.board[[i,y]].color == enemy_color 
                horizontal_dirs << [i, y]
                break
            elsif self.board[[i,y]].color == @color 
                break 
            else
                horizontal_dirs << [i, y]
            end
        end

        (0...y).reverse_each do |j|
            if self.board[[x, j]].color == enemy_color 
                horizontal_dirs << [x, j]
                break
            elsif self.board[[x, j]].color == @color 
                break 
            else
                horizontal_dirs << [x, j]
            end
            
        end
        (y + 1...8).each do |j|
            if self.board[[x, j]].color == enemy_color 
                horizontal_dirs << [x, j]
                break
            elsif self.board[[x, j]].color == @color 
                break 
            else
                horizontal_dirs << [x, j]
            end
        end
        horizontal_dirs
    end

    def moves
      get_horizontal_dirs
    end
end




