class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def initialize(size)
        @size = size
        @grid = Array.new(size) {Array.new(size,nil)}
    end

    def size
        @size
    end

    def [](pos)
        y = pos[0]
        x = pos[1]
        return @grid[y][x]
    end

    def []= (pos,mark)
         y = pos[0]
        x = pos[1]
        @grid[y][x] = mark 
    end

    def complete_row?(mark)
        @grid.any? do |row|
            row.all?{|pos| pos == mark}
        end 
    end

    def complete_col?(mark)
        cols = @grid.transpose
        cols.any? do |row|
            row.all?{|pos| pos == mark}
        end 
    end

    def complete_diag?(mark)
        diag_up?(mark) || diag_down?(mark)
    end

    def diag_up?(mark)
        i = 0
        while i < @size
            return false if self[[i,i]] != mark
            i+=1
        end
        true
    end

    def diag_down?(mark)
        i = 0
        temp_grid = @grid.reverse
        while i < @size
            return false if temp_grid[i][i] != mark
            i+=1
        end
        true
    end

    def winner?(mark)
        return true if complete_col?(mark) || complete_row?(mark) || complete_diag?(mark)
        false
    end

    
end
