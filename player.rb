class Player
  attr_reader :name

  def self.ask_name
    puts 'Enter your Name'
    user_input = gets.chomp
    return ask_name if user_input.empty?
    Player.new(user_input)
  end

  def initialize(name)
    @name = name
  end
end
