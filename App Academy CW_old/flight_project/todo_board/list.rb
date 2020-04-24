require_relative 'item.rb'
class List
    attr_accessor :label
    
    def initialize(label)
        @items = []
        @label = label
    end

    def add_item(title,deadline,description = "")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index.to_i > size - 1 || index.to_i < 0
        true
    end

    def swap(idx1, idx2)
        return false if !valid_index?(idx1) || !valid_index?(idx2)
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        true
    end

    def [](idx)
        return nil if !valid_index?(idx)
        @items[idx]
    end

    def priority
        @items[0]
    end

    def print
        puts @label
        puts "--------------------"
        @items.each_with_index do |item, idx|
            puts "#{idx+1} | #{item.title.ljust(15) }   | #{item.deadline.to_s.ljust(15)} | #{item.done}"
        end
    end

    def print_full_item(idx)
        idx = idx.to_i
        return false if !valid_index?(idx)
        item = @items[idx]
        puts "------------------------------------"
        puts "#{item.title}      #{item.deadline}"
        puts "#{item.description}    #{item.done}" 
        puts "____________________________________"
    end

    def print_priority
        print_full_item(0)
    end
    
    def up(index,amount=1)

        return false if !valid_index?(index)

        amount.times do 
            if index != 0
                @items[index],@items[index-1] =  @items[index-1],@items[index]
                index -= 1
            end 
        end
        true
    end

    def down(index,amount=1)
       return false if !valid_index?(index)

        amount.times do 
            if index != @items.length - 1
                @items[index],@items[index+1] =  @items[index+1],@items[index]
                index += 1
            end 
        end
        true
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle 
    end

    def remove_item(index)
        return false if !valid_index?(index)

        @items.delete_at(index)
        true 
    end

    def purge
        @items.select! {|item| !item.done } 
    end
end

#tests

# l = List.new('Groceries')
#  l.add_item('cheese', '2019-10-25')
#  l.add_item('toothpaste', '2019-10-25')
#  l.add_item('shampoo', '2019-10-24')
#  l.add_item('candy', '2019-10-31')
#  l.print
 
#  p l.down(0,3)

#  l.sort_by_date!

#  l.print
