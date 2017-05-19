class Board
  @@turn = 0
  @@combinations = %w{123 456 789 147 258 369 159 357}

  def initialize(first_player, second_player)
    @grid = Array.new(9)
    @first_player = first_player
    @second_player = second_player
    self.fill_with_coordinates
    self.display
    self.play
  end

  def redraw
    while true
      move = gets.chomp.to_i
      if (@grid[move - 1] != "O" && @grid[move - 1] != "X")
        if @@turn % 2 == 0
          @grid[move - 1] = "O"
          @@turn += 1
          @first_player.make_move(move)
        else
          @grid[move - 1] = "X"
          @@turn += 1
          @second_player.make_move(move)
        end
        self.display
        break
      else
        puts "Choose another move."
      end
    end
  end

  def fill_with_coordinates
    index = 0
    while index < @grid.length
      @grid[index] = (index + 1).to_s
      index += 1
    end
  end

  def display
    puts "----------------------"
    puts "Turn number #{@@turn}."
    puts " "
    index = 0
    while index < 9
      print (index + 1) % 3 == 0 ? @grid[index] + "\n" : @grid[index] + " "
      index += 1
    end
  end

  def play
    while true
      if @@turn % 2 == 0
        puts "#{@first_player.name} move."
      else
        puts "#{@second_player.name} move."
      end
      self.redraw
      if self.game_over?
        break
      end
    end
  end

  def game_over?
    if @@turn % 2 != 0
      player_moves = @first_player.moves.sort.join("")
      @@combinations.each do |element|
        if player_moves.include?(element)
          puts "#{@first_player.name} has WON!"
          return true
        end
      end
    else
      player_moves = @second_player.moves.sort.join("")
      @@combinations.each do |element|
        if player_moves.include?(element)
          puts "#{@second_player.name} has WON!"
          return true
        end
      end
    end
    if @@turn == 9
      puts "The game is over. TIE!"
      return true
    end
    return false
  end
end
