require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize

    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,"_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted? (char)
    return true if attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |letter,i|
      indices << i if char == letter
    end
    indices
  end

  def fill_indices (char,indices)
    indices.each {|i| guess_word[i] = char}
  end

  def try_guess(char)
    if already_attempted?(char)
      print "that has already been attempted"
      return false
    end

    indices = self.get_matching_indices(char)
    @attempted_chars << char
    if indices.length == 0
      @remaining_incorrect_guesses -=1 
    else
      self.fill_indices(char,indices)
    end
    true
    
  end

  def ask_user_for_guess
    print "Enter a char"
    char = gets.chomp
    self.try_guess(char)
  end

  def win?
    if @guess_word.join == @secret_word
      print "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? or self.lose?
      print @secret_word
      return true
    else
      false

    end
  end
  


end
