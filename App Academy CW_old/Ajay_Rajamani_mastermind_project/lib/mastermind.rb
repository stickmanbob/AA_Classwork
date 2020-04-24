require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        puts "Exact: #{@secret_code.num_exact_matches(guess)}"
        puts "Near: #{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        guess = Code.from_string(input)
        print_matches(guess)
        return true if guess == @secret_code
        false
    end

end
