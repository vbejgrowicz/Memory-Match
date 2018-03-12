class Card
  attr_reader :value, :visible, :position

  def initialize(value, position)
    @value = value
    @position = position
    @visible = false
  end

end
