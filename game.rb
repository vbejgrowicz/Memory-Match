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

  def won?
    board.cards_array.all?(&:showing?)
  end

    board.render
  def player_input
    input = nil
    input = player.guess until input && board.valid_position?(input)
    input
  end

  def make_guess
    card = board.reveal(player_input)
    compare_cards(card)
  end

  def play
    until won?
      board.render
      make_guess
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
