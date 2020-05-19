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

    # infinit loop to prompt user to enter a valid combination
    while !player_board.valid_placement?(p_cruiser, cruiser_coords)
      print "Please enter valid cruise coordinates > "
      user_input = gets.chomp.upcase
      cruiser_coords = user_input.split
    end
    # place the cruiser ship
    player_board.place(p_cruiser, cruiser_coords)
    # computer generates the ships and place them
    computer.gen_ship(c_cruiser)

    # reapeat for a submarine
    print "Enter 2 values for a submarine > "
    user_input = gets.chomp.upcase
    submarine_coords = user_input.split

    while !player_board.valid_placement?(p_submarine, submarine_coords)
      print "Please enter valid submarine coordinates > "
      user_input = gets.chomp.upcase
      submarine_coords = user_input.split
    end
    player_board.place(p_submarine, submarine_coords)

    # computer generates submarine coordinates and places them in the board.
    computer.gen_ship(c_submarine)
  end
end
