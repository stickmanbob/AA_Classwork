require_relative "card.rb"

class Board
  attr_reader :grid
  attr_writer :grid
  def initialize(size = 4)
      @grid = Array.new(size) {Array.new(size)}
      @size = size
      @cards = ('A'..'Z').to_a
      self.populate
  end

  def populate
      (0...(@size**2)/2).each do |value|
        assignments = 0
        while assignments < 2
          row, col = rand(0...@size), rand(0...@size)
          if !@grid[row][col]
            @grid[row][col] = Card.new(@cards[value])
            assignments += 1
          end
        end
      end
  end

  def render
    system("clear")
    print "  0 1 2 3\n"
    @grid.each_with_index do |row, idx| 
      print "#{idx} "
      row.each do |card|
        unless card.hidden
          print card.value + " "
        else
          print "_ "
        end
      end
      puts
    end
    nil
  end

  def won?
    
    @grid.all? do |row|
        row.all? {|card| !card.hidden}
    end

  end

  def reveal(guessed_pos)
    row, col = guessed_pos

    if @grid[row][col].hidden 
        @grid[row][col].flip
        return @grid[row][col].value
    else
        return false
    end
  end

  def flip_card(card_value)
    @grid.each do |row|
      row.each do |card|
        card.flip if card.value == card_value && !card.hidden
      end
    end
  end
end



