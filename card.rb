class Card
  attr_reader :value, :visible, :position

  def initialize(value, position)
    @value = value
    @position = position
    @visible = false
  end

  def to_s
    @visible == true ? value.to_s.center(4) : position.to_s.center(4)
  end
end
