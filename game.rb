class Game
  require "./player"
  require "./board"
  attr_accessor :board

  def initialize
    self.greeting
    self.create_players
  end

  def greeting
    puts "Tic Tac Toe Game v.1.0"
    puts "----------------------"
  end

  def create_players
    puts "Please enter the name of the first player"
    first_player = Player.new(gets.chomp)
    puts "Please enter the name of the second player"
    second_player = Player.new(gets.chomp)
    @board = Board.new(first_player, second_player)
  end
end

game = Game.new
