class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  attr_reader :pegs
  def self.valid_pegs?(pegs)
    pegs.each {|peg| return false if !POSSIBLE_PEGS.include?(peg.upcase) }
    true
  end

  def initialize (code)
    raise "invalid code!" if !Code.valid_pegs?(code) #raise an error if the code is not valid
    @pegs = code.map {|peg| peg.upcase}
  end

  def self.random (length)
    pegs = ["R",'G','B','Y']
    code = Array.new (length) {pegs.sample}
    Code.new(code)
  end

  def self.from_string (pegs_string)
    code = pegs_string.upcase.split("")
    Code.new(code)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    correct = 0
    guess.pegs.each_with_index do |peg,i|
      if peg == @pegs[i]
        correct +=1
      end
    end
    correct
  end

  def num_near_matches(guess)
    valid_colors = Hash.new(0)
    near = 0
    @pegs.each {|peg| valid_colors[peg] +=1}
    guess.pegs.each_with_index do |peg,i|
      near += 1 if valid_colors.include?(peg) && !(peg == @pegs[i])
    end
    near
  end

  def ==(code)
    return false if self.length != code.length
    @pegs.each_with_index {|peg,i| return false if peg != code[i]}
    true
  end
  













end
