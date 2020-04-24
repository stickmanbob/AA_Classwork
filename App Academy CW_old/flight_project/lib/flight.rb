class Flight
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers =  []
    end

    def full?
       return true if @passengers.length >= @capacity
       false
    end

    def board_passenger(passenger)
        if !self.full?
            @passengers << passenger if passenger.has_flight?(@flight_number)
        end
    end

    def list_passengers
        @passengers.map {|passenger| passenger.name}
    end

    def [](num)
        @passengers[num]
    end

    def << (passenger)
        self.board_passenger(passenger)
    end


end