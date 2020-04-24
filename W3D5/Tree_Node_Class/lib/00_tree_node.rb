require "byebug"
class PolyTreeNode
    attr_reader :parent, :children, :value
    
    def initialize(value)
        @parent = nil
        @children = []
        @value = value
    end

    def parent=(new_parent)
        if new_parent == nil
            @parent = nil
            return @parent
        end
        if @parent == nil
            @parent = new_parent
            new_parent.children << self
        else
            @parent.children.delete(self)
            @parent = new_parent
            new_parent.children << self
        end
    end

    def add_child(child_node)
        
        if !@children.include?(child_node)
            child_node.parent = self
        end
    end

    def remove_child(child_node)
        if !@children.include?(child_node)
            raise "Not a Child!"
        end
        child_node.parent = nil
        
    end

    def inspect
        "Node #{value} Children #{@children}"
    end

    def dfs(target_value)
        return self if self.value == target_value
        children.each do |child|
            target_node = child.dfs(target_value)
            return target_node if target_node
        end
        nil 
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            dequeued = queue.shift
            return dequeued if target_value == dequeued.value
            queue.concat(dequeued.children)
        end
    end
end