module Slideable
    HORIZONTAL_DIRS = [[-1,0],[1,0],[0,-1],[0,1]]
    DIAGONAL_DIRS = [[-1,-1],[-1,1],[1,-1],[1,1]]
    
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs 
        DIAGONAL_DIRS
    end

    def moves 
        valid_moves = []
        move_dirs.each do |dx,dy|
            valid_moves.concat(grow_unblocked_moves_dir(dx,dy))
        end
        valid_moves
    end

    def move_dirs 
        raise NoMethodError "Slideable needs fcn move_dirs to work!"
    end

    def grow_unblocked_moves_dir(dx,dy)
        cur_x, cur_y = @pos 
        valid_moves = []
        blocked = false
        until blocked 
            cur_x, cur_y = cur_x + dx, cur_y + dy 
            new_pos = [cur_x,cur_y]
            if !@board.valid_pos?(new_pos)
                blocked = true
            elsif @board[new_pos].empty?
                valid_moves << new_pos
            elsif @board[new_pos].color != @color
                valid_moves << new_pos 
                blocked = true 
            else
                blocked = true 
            end
        end       
        valid_moves
    end

end