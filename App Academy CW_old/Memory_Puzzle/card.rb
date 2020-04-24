class Card
  attr_reader :value, :hidden
   
  def initialize(value)
    @hidden = true
    @value = value
  end

  def flip
    @hidden = !@hidden
  end
  

  def ==(other_card)
    self.value == other_card.value
  end

end