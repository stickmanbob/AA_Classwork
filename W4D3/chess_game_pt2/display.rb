require_relative "cursor.rb"
require_relative "board.rb"
require 'colorize'

class Display
    attr_reader :cursor
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end

    def render
        alpha = "abcdefgh"
        puts "  0 1 2 3 4 5 6 7"
        @board.grid.each_with_index do |row,i| 
            print "#{alpha[i]} "
            row.each_with_index do |space, j|
                if [i,j] == @cursor.cursor_pos
                    print space.symbol.colorize(:background => :light_cyan)
                    print " "
                else
                    print space.symbol
                    print " "
                end
            end
        print "\n"
        end
    end
end

b = Board.new
d = Display.new(b)
while true
    system('clear')
    d.render
    d.cursor.get_input
end