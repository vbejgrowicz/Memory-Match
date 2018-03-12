class Board
  def self.generate_size(level)
    board_size = { easy: 4, medium: 6, hard: 8 }
    Board.new(board_size[level])
  end
  def initialize(size)
    @size = size
    @cards_array = []
  end
end
