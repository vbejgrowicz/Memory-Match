require './card'

class Board
  def self.generate_size(level)
    board_size = { easy: 4, medium: 6, hard: 8 }
    Board.new(board_size[level])
  end
  def initialize(size)
    @size = size
    @cards_array = []
    populate_cards
  end

  def populate_cards
    positions = position_ids
    card_values.each_with_index do |value, index|
      cards_array << Card.new(value, positions[index])
    end
    cards_array
  end
  private

  def position_ids
    ids = []
    rows = ('A'..'Z').to_a.slice(0, size)
    rows.each do |letter|
      (1..size).each { |number| ids << "#{letter}#{number}" }
    end
    ids
  end

  def card_values
    values = (1..(size * size / 2)).to_a
    card_values = values.concat(values)
    card_values.shuffle!
  end
  end
end
