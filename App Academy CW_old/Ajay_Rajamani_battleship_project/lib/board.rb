class Board
    
    attr_reader :size

    def initialize(size)
        @grid = Array.new(size) {Array.new(size,:N)}
        @size = size**2
  
    end

    def [](coords)
        @grid[coords[0]][coords[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships 
        @grid.flatten.count (:S)
    end

    def attack(pos)
        
        
        if self[pos] == :S
            self[pos]= :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X 
            return false
        end
        
    end

    def place_random_ships
        num_of_ships = (size*0.25).to_i 
        max_length = @grid.length - 1
        i = 0
        while i < num_of_ships 
            pos = [rand(max_length),rand(max_length)]    
            if self[pos] != :S 
                
                self[pos] = :S
                i+=1

            end
        end

        
    end

    def hidden_ships_grid
        hidden = []
        @grid.each do |arr|
            hidden << arr.map{|ele| 
            if ele == :S 
                :N 
            else
                ele 
            end
            }
        end
        hidden
    end

    def self.print_grid(grid)
        grid.each do |arr|
            puts arr.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end










    
    





end
