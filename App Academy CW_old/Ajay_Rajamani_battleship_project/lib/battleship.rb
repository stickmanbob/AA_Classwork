require_relative "board"
require_relative "player"

class Battleship
    attr_reader :board, :player 

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size / 2
    end

    def start_game
        @board.place_random_ships
        
        @board.print
        print @board.num_ships
        
    end

    def lose?
        if @remaining_misses <=0
            print 'you lose'
            return true
        else
            false
        end
    end

    def win?
        ships = @board.num_ships
        if ships == 0 
            print 'you win'
            true
        else
            false
        end
    end

    def game_over?
        if win? or lose?
            return true
        else
            false
        end
    end

    def turn
        move = player.get_move
        @remaining_misses -=1 if !@board.attack(move)   
        
        @board.print 
        puts @remaining_misses
        
        
        
    end






end
