class Player
  attr_reader :name, :moves

  def initialize(name)
    @name = name
    @moves = Array.new
  end

  def make_move(move)
    moves.push(move)
  end
end
