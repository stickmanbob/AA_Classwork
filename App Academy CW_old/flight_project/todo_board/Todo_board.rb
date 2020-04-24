require_relative "list.rb"

class TodoBoard

    

    def initialize
        @lists = {}
    end

    def get_command
        print "\nEnter a command: "
        cmd, label, *args = gets.chomp.split(" ")

        case cmd
        when "mklist"
            @lists[label] = List.new(label)
        when "ls"
            @lists.each { |k, v| puts k }
        when "showall"
            @lists.each { |k, v| v.print }
        when "mktodo"
            list = @lists[label]
            list.add_item(*args)
        when "quit"
            return false
        when "up"
            list = @lists[label]
            args = args.map {|ele| ele.to_i}
            list.up(*args)
        when "down"
            list = @lists[label]
            args = args.map {|ele| ele.to_i}
            list.down(*args)
        when "swap"
            list = @lists[label]
            args = args.map {|ele| ele.to_i}
            list.swap(*args)
        when "sort"
            list = @lists[label]
            list.sort_by_date!
        when "priority"
            list = @lists[label]
            list.priority
        when "print"
            list = @lists[label]
            if args.length == 0
                list.print 
            else
                list.print_full_item(*args)
            end
        when "toggle"
            list = @lists[label]
            args = args.map {|ele| ele.to_i}
            list.toggle_item(*args) 
        when "rm"
            list = @lists[label]
            args = args.map {|ele| ele.to_i}
            list.remove_item(*args)
        when "purge"
            list = @lists[label]
            list.purge
        else
            print "Invalid command"
        end
        true
    end

    def run
        should_run = true
        while should_run
            if !get_command
                should_run = false
            end
        end
    end

end

todo = TodoBoard.new
todo.run