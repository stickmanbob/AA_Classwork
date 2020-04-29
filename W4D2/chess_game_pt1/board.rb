require_relative "piece.rb"
class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(8) {Array.new(8,NullPiece.instance)}
        place_pieces
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def place_pieces
        @grid[0].fill {Piece.new(:white, self, [0,0])}
        @grid[7].fill {Piece.new(:black, self, [0,0])}
    end

    def move_piece(start_pos, end_pos)
        raise "Null piece at start" if self[start_pos] == NullPiece.instance
        raise "Invalid move" if (end_pos[0] < 0 || end_pos[0] > 7) || (end_pos[1] < 0 || end_pos[1] > 7)
        self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end

    def print_board
        @grid.each do |row| 
            row.each do |space|
                print space.inspect  
                print " "
            end
        print "\n"
        end
    end

end

b = Board.new 

b.print_board

p b[[0,0]].moves

b[[4,5]] = Piece.new(:white, b,[4,5])
p b[[4,5]].moves
b.print_board