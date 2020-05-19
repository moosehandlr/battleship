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

  def gen_shot(board)
    shot = @coords.sample
    board.cells[shot].fire_upon
    @coords.delete(shot)
  end
end
