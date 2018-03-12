require './player'
require './board'

class Game
  attr_reader :player, :board

  def initialize
    @player = Player.ask_name
    @difficulty = set_difficulty
    @board = Board.generate_size(@difficulty)
    play
  end

  end
  private

  def set_difficulty
    levels = %i[easy medium hard]
    puts 'Enter a Difficulty: Easy, Medium, Hard'
    user_input = gets.chomp.downcase.to_sym
    return set_difficulty unless levels.include?(user_input)
    user_input
  end
end

Game.new
