require './card'

class Board
  def self.generate_size(level)
    board_size = { easy: 4, medium: 6, hard: 8 }
    Board.new(board_size[level])
  end

  attr_reader :cards_array, :size

  def initialize(size)
    @size = size
    @position_ids = position_ids
    @cards_array = []
    populate_cards
  end

  def populate_cards
    card_values.each_with_index do |value, index|
      cards_array << Card.new(value, position_ids[index])
    end
    cards_array
  end

  def render
    system('clear')
    borders = '-' * (10 * (size / 2) + 1)
    display_string = ''
    card_grid.each_with_index do |row, index|
      display_string << borders + "\n" if index.zero?
      display_string << '|'
      display_string << row.join('|')
      display_string << '|' + "\n"
      display_string << borders + "\n"
    end
    puts display_string
  end

  def reveal(id)
    card = find_card(id)
    if card.showing?
      puts "You can't flip a card that is already revealed"
    else
      card.show
    end
    card
  end

  def match?(card1, card2)
    card1.value == card2.value
  end

  def valid_position?(position)
    position_ids.include?(position)
  end

  private

  def find_card(id)
    position = position_ids.index(id)
    cards_array[position]
  end

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

  def card_grid
    rows = cards_array.each_slice(size)
    grid = rows.map do |row|
      row.map(&:to_s)
    end
    grid
  end
end
