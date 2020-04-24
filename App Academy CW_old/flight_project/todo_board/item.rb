class Item

    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date)
        parts = date.split("-")
        parts.each_with_index do |part, idx|
            if idx == 0
                return false if part.length != 4
            end
            if idx == 1
                return false if part.length != 2 || part.to_i > 12 || part.to_i < 1
            end
            if idx == 2
                return false if part.length != 2 || part.to_i > 31 || part.to_i < 1
            end
        end
        true
    end

    def initialize(title, deadline, description)
        @title = title
        raise "invalid date" if !Item.valid_date?(deadline)
        @deadline = deadline
        @description = description
        @done = false 
    end

    def deadline=(date)
        if Item.valid_date?(date)
            @deadline = date
        else
            raise "invalid date"
        end
    end

    def toggle
        if !@done 
            @done = true 
        else
            @done = false
        end
    end



end
