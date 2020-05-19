class Player
  attr_reader :player_type,
              :board,
              :ships

  def initialize (player_type, board, ships)
    @player_type = player_type
    @board = board
    @ships = ships

  end

  def add_ship(new_ship)
    @ships << ship
  end
end
