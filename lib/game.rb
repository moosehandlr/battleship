require "./lib/ship"
require "./lib/board"
require "./lib/player"

class Game
  def start
    player_board = Board.new
    computer_board = Board.new

    player = Player.new(player_board)
    computer = Player.new(computer_board)
    # create comp and user cruiser and submarine
    p_cruiser = Ship.new("Cruiser", 3)
    c_cruiser = Ship.new("Cruiser", 3)
    c_submarine = Ship.new("submarine", 2)
    p_submarine = Ship.new("submarine", 2)

    # Tempt user to enter coordinates
    puts "Use this board as a map to enter ship coordinares"
    puts player_board.render

    print "Enter 3 coordinates for a cruiser > "
    user_input = gets.chomp.upcase
    cruiser_coords = user_input.split


  end
end
