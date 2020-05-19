class Player
  attr_reader :board
  def initialize(board)
    @board = board
    @coords = board.cells.keys
  end

  def gen_ship(ship)
    coords = @board.all_possible_coordinates_to_be_placed(ship.length).sample
    @board.place(ship, coords)
  end
end
