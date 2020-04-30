require_relative "all_pieces.rb"

class Board
    attr_accessor :grid, :white_pieces, :black_pieces
    def initialize(new_board = true)
        @grid = Array.new(8) {Array.new(8,NullPiece.instance)}
        @white_pieces = []
        @black_pieces = []
        place_pieces if new_board
    end

    def [](pos)
        x, y = pos
        @grid[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def valid_pos?(pos)
        return false if (pos[0] < 0 || pos[0] > 7) || (pos[1] < 0 || pos[1] > 7)
        true
    end

    def place_pieces
        place_pawns(6,:white)
        place_pawns(1,:black)
        place_value_pieces(7,:white)
        place_value_pieces(0,:black)
    end

    def place_pawns(row,color)
        @grid[row].each_with_index do |ele,i|
            new_pawn = Pawn.new(color, self, [row,i])
            @grid[row][i] = new_pawn
            color == :white ? @white_pieces << new_pawn : @black_pieces << new_pawn
        end
    end

    def place_value_pieces(row,color)
        @grid[row].each_with_index do |ele,i|
            
            if i == 0 || i== 7
                new_piece = Rook.new(color,self,[row,i])
                @grid[row][i] = new_piece
                color == :white ? @white_pieces << new_piece : @black_pieces << new_piece
            elsif i== 1 || i == 6
                new_piece = Knight.new(color,self,[row,i])
                @grid[row][i] = new_piece
                color == :white ? @white_pieces << new_piece : @black_pieces << new_piece
            elsif i == 2 || i == 5
                new_piece = Bishop.new(color,self,[row,i])
                @grid[row][i] = new_piece
                color == :white ? @white_pieces << new_piece : @black_pieces << new_piece
            elsif i == 3
                color == :white ?  new_piece = Queen.new(color,self,[row,i]) : new_piece = King.new(color,self,[row,i])
                @grid[row][i] = new_piece
                color == :white ? @white_pieces << new_piece : @black_pieces << new_piece
            else 
                color == :white ?  new_piece = King.new(color,self,[row,i]) : new_piece = Queen.new(color,self,[row,i])
                @grid[row][i] = new_piece
                color == :white ? @white_pieces << new_piece : @black_pieces << new_piece
            end
        end
    end

    def move_piece(start_pos, end_pos)
        raise "Null piece at start" if self[start_pos] == NullPiece.instance
        raise "Invalid start position" if !valid_pos?(start_pos)
        raise "Invalid move" unless valid_pos?(end_pos)
        @white_pieces.reject! { |piece| piece == self[end_pos]}
        @black_pieces.reject! { |piece| piece == self[end_pos]}
        piece = self[start_pos]
        self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
        piece.pos = end_pos
    end

    def in_check?(color)
        king = @grid.flatten.find { |ele| ele.is_a?(King) && ele.color == color }
        raise "Something is seriously wrong" if king.nil?

        color == :white ? enemy = @black_pieces : enemy = @white_pieces
        enemy.any? { |enemy_piece| enemy_piece.valid_moves.include?(king.pos) }
    end

    def checkmate?(color)

        color == :black ? pieces = @black_pieces : pieces = @white_pieces
        pieces.none? {|piece| piece.valid_moves.length > 0}

    end

    def dup
        b = Board.new(false)
        @grid.each_with_index do |row, x|
            row.each_with_index do |piece, y|
                if piece == NullPiece.instance
                    b.grid[x][y] = NullPiece.instance
                else
                    new_pos = [x,y]
                    new_color = piece.color
                    piece_type = piece.class
                    new_piece = piece_type.new(new_color, b, new_pos)
                    b.grid[x][y] = new_piece
                    new_piece.color == :white ? b.white_pieces << new_piece : b.black_pieces << new_piece
                end
            end
        end
        b
    end

    def print_board
        alpha = "abcdefgh"
        @grid.each_with_index do |row,i| 
            print "#{alpha[i]} "
            row.each_with_index do |space, j|
                print space.symbol
                print " "

            end
            print "\n"
        end
    end

end

if $PROGRAM_NAME == __FILE__
    b = Board.new 
    # b.move_piece([0,3], [5,2])
    # # p b.white_pieces.map { |ele| ele.symbol}
    # # p b.black_pieces.map { |ele| ele.symbol}
    # p b.in_check?(:black)
    # p b.checkmate?(:black) 

    # c = b.dup 
    # c.print_board
    # p c.white_pieces.map { |ele| ele.symbol}
    # p c.black_pieces.map { |ele| ele.symbol}
    # c.move_piece([1,1],[2,1])
    # c.print_board
    # b.print_board
    p b[[1,1]].valid_moves
end



