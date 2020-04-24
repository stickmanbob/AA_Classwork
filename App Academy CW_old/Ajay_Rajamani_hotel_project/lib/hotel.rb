require_relative "room"

class Hotel

    def initialize(name, room_types)
        @name = name
        @rooms = {}

        room_types.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        words = @name.split
        words.map! {|word| word.capitalize}
        words.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(name)
        return true if rooms.include?(name)
        false
    end

    def check_in (person, room_name)
         if !room_exists?(room_name)

            print "sorry, room does not exist"
         else

            if @rooms[room_name].add_occupant(person)
                print "check in successful"
            else
                print 'sorry, room is full'
            end
        end

        
    end
    
    def has_vacancy?
        rooms.any? do |name,room|
            !room.full?
        end
    end

    def list_rooms
        rooms.each do |k,room|
            puts "#{k} : #{room.available_space}"
        end
    end


end
