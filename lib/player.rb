class Player
  attr_reader :board
  def initialize(board)
    @board = board
    @coords = board.cells.keys
  end
end
