require_relative "./Tree_Node_Class/lib/00_tree_node.rb"
require "byebug"
class KnightPathFinder

    def initialize(start)
        
        @root_node = PolyTreeNode.new(start)
        @considered_positions = [start]
        self.build_move_tree

    end 

    def self.valid_moves(pos)
        moves = []
        x = pos[0]
        y = pos[1]
        moves << [x+2, y+1]
        moves << [x+2, y-1]
        moves << [x-2, y+1]
        moves << [x-2, y-1]
        moves << [x+1, y+2]
        moves << [x-1, y+2]
        moves << [x+1, y-2]
        moves << [x-1, y-2]
        moves.select do |move|
           0 <= move[0] and move[0] < 8 and 0 <= move[1] and move[1] < 8
            
        end
    end

    def new_move_positions(pos)
        
        new_moves = KnightPathFinder.valid_moves(pos).select{|move| !@considered_positions.include?(move) }
        @considered_positions += new_moves 
        new_moves

    end

    def build_move_tree
        # debugger
        queue = [@root_node]
        while !queue.empty?
            start_pos = queue.shift
            new_moves = self.new_move_positions(start_pos.value)
            new_moves.each {|move| start_pos.add_child(PolyTreeNode.new(move))}
            queue.concat(start_pos.children)
        end
        return @root_node
    end

    def find_path(dest)
        end_node = @root_node.dfs(dest)
        # debugger
        self.trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        path = []
        current_node = end_node
        while path[0] != @root_node.value
            path.unshift(current_node.value)
            current_node = current_node.parent unless current_node.parent == nil
        end
        path
    end
end
##############
##TEST CASES##
##############
# kpf = KnightPathFinder.new([0, 0])
# p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
# p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]